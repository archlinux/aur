# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=pcb-rnd
pkgver=3.1.6
pkgrel=1
pkgdesc="free/open source, flexible, modular Printed Circuit Board editor"
url="http://www.repo.hu/projects/pcb-rnd/"
arch=('x86_64')
license=('GPL2')
depends=('librnd4>=4.1.0'
         'libxml2')
optdepends=('freetype2: import_ttf plugin'
            'fungw'
            'imagemagick: for running the pixmap export tests')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('067be03df902ef52b34a1115e086da6790fe9de20f237e0a047575f79fa007f6')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
