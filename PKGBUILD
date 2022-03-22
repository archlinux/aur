# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=camv-rnd
pkgver=1.0.2
pkgrel=1
pkgdesc="free/open source, small, flexible viewer for PCB-related CAM file formats"
url="http://www.repo.hu/projects/camv-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd3>=3.1.1'
         'freetype2')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('c4cfcb57cd678180f6d05c241c4f1ef915c95fbf092fc28342a2997ef7d3b9ef')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
