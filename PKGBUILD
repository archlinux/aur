# Maintainer: Ameyama Izumi <souiken@oneamongus.ca>

pkgname=bakaxl-bunny
pkgver=4.0.0.bunny_aac68df
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
sha256sums=('feb803cb133c47fae65a6494c7f9ea7969295bdfef80c27033f0d930ac4c5411')

package() {
  bsdtar -xf "${srcdir}/bakaxl-${pkgver//.bunny_/+bunny-}-linux-${arch}.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
