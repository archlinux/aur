# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: tantalum <tantalum at online dot de>
pkgname=guile-lib
pkgver=0.2.2
pkgrel=2
pkgdesc='Repository of useful code written in Guile Scheme'
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL3')
depends=('guile')
url="http://www.nongnu.org/guile-lib/"
install=$pkgname.install
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('77427e4ff3f2b1061bffa370666125f7')

build(){
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/info/dir"
}
