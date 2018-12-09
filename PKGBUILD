# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=haunt
pkgver=0.2.4
pkgrel=1
pkgdesc="Static site generator written in Guile Scheme"
arch=('any')
url="https://haunt.dthompson.us"
license=('GPL3')
depends=('guile')
optdepends=('guile-reader: Skribe support'
            'guile-commonmark: CommonMark support')
makedepends=('guile-reader' 'guile-commonmark')
source=("https://files.dthompson.us/haunt/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b705a3d842488bd1149901058be858d7194be60a7ca68db21904e550ae1a7cf34275c67c260555dd9686a15e605794966757f793df5882e44f54a4c08e5ca87a')

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}
