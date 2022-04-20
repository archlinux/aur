# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=pcb-rnd
pkgver=3.0.4
pkgrel=1
pkgdesc="free/open source, flexible, modular Printed Circuit Board editor"
url="http://www.repo.hu/projects/pcb-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd3' 'libxml2')
optdepends=('gd: gd based exports and pixmap imports (png, gif, jpeg)'
            'freetype2: import_ttf plugin'
            'fungw')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('0c05ec61d67633b63b94abc3791419a55f5b8f72430ba65eff3f27abcf49d67d')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
