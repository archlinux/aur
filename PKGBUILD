# Maintainer: Ameyama Izumi <souiken@oneamongus.ca>

pkgname=bakaxl-bunny
pkgver=4.0.0.bunny_5ca7164
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
sha256sums=('c6266ddab6f1fa94b9053340c688c1e28155d69172ffb5d614cc4ef258996373')

package() {
  bsdtar -xf "${srcdir}/bakaxl-${pkgver//.bunny_/+bunny-}-linux-${arch}.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
