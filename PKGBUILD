# Maintainer: Ameyama Izumi <souiken@oneamongus.ca>

pkgname=bakaxl-bunny
pkgver=4.0.0.bunny_5e366a5
pkgrel=1
pkgdesc="Next Generation BakaXL Launcher. (none)"
arch=('x86_64')
url="https://bakaxl.com"
depends=(
  'cairo'
  'gdk-pixbuf2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
  'glib2'
  'gcc-libs'
  'glibc'
  'openssl'
)
makedepends=(
  'desktop-file-utils'
)

source=("https://github.com/BakaXL-Launcher/BakaXL/releases/download/${pkgver//.bunny_/+bunny-}/bakaxl-${pkgver//.bunny_/+bunny-}-linux-${arch}.deb")
sha256sums=('9f1fcde49587052b0348c8ee8e9b9b25d8d90924384ae7dfdaf85ddc18231ac4')

package() {
  bsdtar -xf "${srcdir}/bakaxl-${pkgver//.bunny_/+bunny-}-linux-${arch}.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
