# Maintainer: Giovan Battista "giomba" Rolandi <giomba at glgprograms dot it>
pkgname=2cdt
pkgver=1.4
pkgrel=1
pkgdesc="Create CDT/TZX for Amstrad/Spectrum out of raw files"
arch=('x86_64')
url="http://cpctech.cpcwiki.de/download/2cdt.zip"
license=('GPL2')
depends=()
# official source is the following, but SSL certificate keeps breaking
# http://cpctech.cpcwiki.de/download/2cdt.zip
source=('https://box.glgprograms.it/users/giomba/2cdt.zip')
sha256sums=('5ffe321b111203f4d901da5c83999179138d4bec5d9771d085e084c195bbe82c')

prepare() {
  # apply patches here
  true
}

build() {
  cd "${srcdir}/${pkgname}"
  make clean
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${pkgname}/2cdt ${pkgdir}/usr/bin
}

