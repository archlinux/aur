# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=pcb-rnd
pkgver=3.0.5
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
sha256sums=('3d352922b1c7bc3a7077784ce73651d52b10acbf71ab9f9c5daa6305f5ae3f09')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
