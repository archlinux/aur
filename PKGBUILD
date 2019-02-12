# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=trinity
pkgver=1.9
pkgrel=1
pkgdesc="A Linux System call fuzz tester"
arch=('i686' 'x86_64')
url="http://codemonkey.org.uk/projects/trinity/"
license=('GPL')
source=(http://codemonkey.org.uk/projects/trinity/$pkgname-$pkgver.tar.xz)
sha1sums=('14fa2a95c476a92fdeed415042c312563dad643f')

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
}
