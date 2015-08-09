# Contributor: TDY <tdy@gmx.com>

pkgname=fpm2
pkgver=0.79
pkgrel=1
pkgdesc="Figaro's Password Manager 2"
arch=('i686' 'x86_64')
url="http://als.regnet.cz/fpm2/"
license=('GPL')
depends=('gtk2')
makedepends=('intltool>=0.35.0' 'pkgconfig>=0.9.0')
source=(http://als.regnet.cz/$pkgname/download/$pkgname-$pkgver.tar.bz2)
sha256sums=('d55e9ce6be38a44fc1053d82db2d117cf3991a51898bd86d7913bae769f04da7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
