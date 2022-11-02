# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=pcb-rnd
pkgver=3.0.6
pkgrel=2
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
sha256sums=('ea6f0d9a3d6ffbbcdfe7decc51f9165f684fbb8fb6139951e8eb4e226bb39a22')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
