# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: tantalum <tantalum at online dot de>

pkgname=guile-lib
pkgver=0.2.8.1
pkgrel=1
pkgdesc='Repository of useful code written in Guile Scheme'
arch=('x86_64')
license=('GPL-3.0-or-later AND LGPL-3.0-or-later')
depends=('guile')
url="http://www.nongnu.org/guile-lib/"
source=("https://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1374c2d839e6a33d190cd1dabd9c7f87753f8384f55b866f3e142155c22b49b1')

build(){
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-silent-rules --with-guile-site
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/info/dir"
}
