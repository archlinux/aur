# Maintainer: Eric Waller <ewwaller dot gmail dot com>
pkgname=probability
pkgver=b55e508d94e6
pkgrel=2
pkgdesc="Probability Machine Simulator"
arch=('i686' 'x86_64')
url="https://bitbucket.org/ewaller/probability"

license=('GPL')
groups=(users)
depends=(gtk2)
makedepends=('make' 'gcc')
source=(https://bitbucket.org/ewaller/probability/get/tip.tar.bz2)

md5sums=('b88bff8b275fce54509fcec44c39ecb5')
build() {
  cd "$srcdir/ewaller-$pkgname-$pkgver"
  automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/ewaller-$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/share/probability"
  mkdir "$pkgdir/usr/share/probability/data"
  cp src/main.ui "$pkgdir/usr/share/probability"
  cp src/data/probability.png "$pkgdir/usr/share/probability/data"
  cp src/data/runIcon.png "$pkgdir/usr/share/probability/data"
}

# vim:set ts=2 sw=2 et:
