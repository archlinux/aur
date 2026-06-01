# Maintainer: LeafEvans <leaf@nox.player>
# AUR package for Nox — minimalist video player built with mpv and Tauri

pkgname=nox-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Nox. Just watch. — a minimalist video player built with mpv and Tauri"
arch=('x86_64')
url="https://github.com/LeafEvans/nox"
license=('MPL-2.0')
depends=('mpv' 'fuse2')
makedepends=()
optdepends=()
provides=('nox')
conflicts=('nox')

source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/LeafEvans/nox/releases/download/v${pkgver}/Nox_${pkgver}_amd64.AppImage"
  "nox.desktop::https://raw.githubusercontent.com/LeafEvans/nox/v${pkgver}/aur/nox-bin/nox.desktop"
  "nox.png::https://raw.githubusercontent.com/LeafEvans/nox/v${pkgver}/app-icon.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  # Install AppImage
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/nox"

  # Desktop entry
  install -Dm644 "${srcdir}/nox.desktop" "${pkgdir}/usr/share/applications/nox.desktop"

  # Icon
  install -Dm644 "${srcdir}/nox.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/nox.png"
}
