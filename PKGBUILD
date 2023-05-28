# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=pcb-rnd
pkgver=3.1.1
pkgrel=1
pkgdesc="free/open source, flexible, modular Printed Circuit Board editor"
url="http://www.repo.hu/projects/pcb-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd4>=4.0.0'
         'libxml2')
optdepends=('freetype2: import_ttf plugin'
            'fungw'
            'imagemagick: for running the pixmap export tests')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('af21169c719b7c3d4602df1f10e1ad99522c171fe49c4d351f902702c4d5ec6b')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
