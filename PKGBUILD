# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=sch-rnd
pkgver=1.0.7
pkgrel=1
pkgdesc="simple, modular, scriptable schematics editor"
url="http://www.repo.hu/projects/sch-rnd/"
arch=('x86_64')
license=('GPL2')
depends=('librnd4>=4.1.0'
         'libxml2')
optdepends=('freetype2: import_ttf plugin'
            'fungw')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('283f023f0988f7aecdc3ed6382e7c0135d9bea1f463cddf7fa126015b3a282b6')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/"
  make test
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
