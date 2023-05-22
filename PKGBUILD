# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=sch-rnd
pkgver=1.0.0
pkgrel=1
pkgdesc="simple, modular, scriptable schematics editor"
url="http://www.repo.hu/projects/pcb-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd4>=4.0.0'
         'libxml2')
optdepends=('freetype2: import_ttf plugin'
            'fungw')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('e459b8c5515eb98baa087cea744dc6339641f2aadbc5196fbd8c5d52802fe15f')

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
