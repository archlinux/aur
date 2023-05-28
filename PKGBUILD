# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=camv-rnd
pkgver=1.1.2
pkgrel=2
pkgdesc="free/open source, small, flexible viewer for PCB-related CAM file formats"
url="http://www.repo.hu/projects/camv-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd4>=4.0.0'
         'freetype2')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('4c4d7fc6d4a89a62e1958d8fc772c8da56a997fe78f023503324bafbc0529d03')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  if [ ! -d /usr/share/fonts ]; then
    mkdir -p /usr/share/fonts
  fi
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
