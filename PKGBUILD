# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=camv-rnd
pkgver=1.0.0
pkgrel=1
pkgdesc="free/open source, small, flexible viewer for PCB-related CAM file formats"
url="http://www.repo.hu/projects/camv-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd3'
         'freetype2')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('edf86c4d7d94364abc2b20bbfb3a78501a899f0b324ce0ecda632efd867a1a15')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
