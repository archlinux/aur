# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgname="melonds"
pkgname="${_pkgname}-bin"
pkgver=0.9.3
pkgrel=2
pkgdesc="DS emulator, sorta"
arch=("x86_64" "aarch64")
url="http://melonds.kuribo64.net/"
license=("GPL3")
depends=("libepoxy" "libslirp" "qt5-base" "sdl2")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/Arisotura/melonDS/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("c50a3855c1f77f58a2b15045687dc399b845224a970fe68ff95919c939ac634f")

source_x86_64=("https://melonds.kuribo64.net/downloads/melonDS_${pkgver}_linux_x64.7z")
sha256sums_x86_64=("41d3f4f42ba3c3e263df9db6e73229068eeb85eb6a8f2ee46d2fe482df57b130")

source_aarch64=("https://melonds.kuribo64.net/downloads/melonDS_${pkgver}_linux_arm64.7z")
sha256sums_aarch64=("2f900d036808e790dc33ee79ba46c93adda9fd25ae2af8e074c9918ad9e3fd62")

package() {
  # Install binary
  install -Dm0755 melonDS "${pkgdir}/usr/bin/melonDS"

  # Install icons
  for size in 16 32 64 128 256; do
    install -Dm0644 "melonDS-${pkgver}/icon/melon_${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/net.kuribo64.melonDS.png"
  done

  # Install desktop entry
  install -Dm0644 "melonDS-${pkgver}/net.kuribo64.melonDS.desktop" "${pkgdir}/usr/share/applications/net.kuribo64.melonDS.desktop"
}
