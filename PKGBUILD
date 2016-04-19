# Maintainer: Tinu Weber <takeya@bluewin.ch>

pkgname=ttylog
pkgver=0.26
pkgrel=1
pkgdesc="A serial port logger"
arch=('x86_64')
url='http://ttylog.sourceforge.net/'
license=('GPL2')
makedepends=()
depends=()
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${pkgname}_${pkgver}.tar.gz"
        bindir.patch)
md5sums=('0ccad5652e1174ebc6c6b1232a7af29e'
         'dff526b5cff59dbc14cd76d81b1786e8')
conflicts=()
provides=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../bindir.patch
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
