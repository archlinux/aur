# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=sch-rnd
pkgver=0.9.3
pkgrel=1
pkgdesc="free/open source, flexible, modular Printed Circuit Board editor"
url="http://www.repo.hu/projects/pcb-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd3>=3.2.0'
         'libxml2')
optdepends=('gd: gd based exports and pixmap imports (png, gif, jpeg)'
            'freetype2: import_ttf plugin'
            'fungw')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('42445fae1f10a3822e3a6ef9c099c2b5dbf4599eb4cf46b33d9d94816a5d7d01')

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
