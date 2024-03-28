# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=sch-rnd
pkgver=1.0.4
pkgrel=1
pkgdesc="simple, modular, scriptable schematics editor"
url="http://www.repo.hu/projects/sch-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd4>=4.1.0'
         'libxml2')
optdepends=('freetype2: import_ttf plugin'
            'fungw')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('c2bdcc4520d9a6522d4eb30b4b7db08292b887079a158019d50c3651d1442cfb')

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
