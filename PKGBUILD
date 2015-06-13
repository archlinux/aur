# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: yannsen <ynnsen@gmail.com>

pkgname=tn5250
pkgver=0.17.4
pkgrel=6
pkgdesc='A 5250 terminal emulator for IBM iSeries and AS400'
arch=('i686' 'x86_64')
url="http://tn5250.sourceforge.net/"
license=('LGPL 2.1')
depends=(openssl)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('d1eb7c5a2e15cd2f43a1c115e2734153')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
