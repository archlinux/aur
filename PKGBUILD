# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=joy
pkgver=1
pkgrel=1
pkgdesc="A purely functional concatenative language."
arch=('i686' 'x86_64')
#url="http://www.latrobe.edu.au/philosophy/phimvt/joy.html"
url="http://www.kevinalbrecht.com/code/joy-mirror/joy.html"
license=('BSD')
depends=('glibc')
#source=("http://www.latrobe.edu.au/philosophy/phimvt/joy/joy.tar.gz")
#source=("http://www.ccil.org/~cowan/joy.tar.gz")
source=("http://www.kevinalbrecht.com/code/joy-mirror/joy.tar.gz")
md5sums=('f37c0bd7cb1263d6b842bd4a346e7442')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/doc/joy"
  install -d "$pkgdir/usr/bin/"
  install -Dm644 plain-manual.html "$pkgdir/usr/share/doc/joy/"
  install -Dm755 joy "$pkgdir/usr/bin/"
}
