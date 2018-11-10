# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=tchem
_pkgname=ck
pkgver=8ee6fba5bf41
pkgrel=1
pkgdesc="A Software Toolkit for the Analysis of Complex Kinetic Models"
arch=('i686' 'x86_64')
url="https://bitbucket.org/jedbrown/tchem"
license=('BSD')
source=("https://bitbucket.org/jedbrown/tchem/get/8ee6fba5bf41.zip")
makedepends=('boost')
depends=('boost-libs')
md5sums=('4a81bd9149ca4e4c0f50eab6037598f0')

build() {
  cd ${srcdir}/jedbrown-${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd ${srcdir}/jedbrown-${pkgname}-${pkgver}
  mkdir -p "$pkgdir/usr/share/doc/tchem"
  cp doc/sandtchem.pdf "$pkgdir/usr/share/doc/tchem/"
  cp -r example "$pkgdir/usr/share/doc/tchem/"
  cp -r include "$pkgdir/usr"
  cp -r lib "$pkgdir/usr"
}
