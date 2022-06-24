# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=camv-rnd
pkgver=1.0.3
pkgrel=1
pkgdesc="free/open source, small, flexible viewer for PCB-related CAM file formats"
url="http://www.repo.hu/projects/camv-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd3>=3.1.1'
         'freetype2')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('2d88e4acc82beaadc70ab987cf6422bb1e1b354604c051d31597da78ddce13c8')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
