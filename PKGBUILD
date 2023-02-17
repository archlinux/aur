# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=camv-rnd
pkgver=1.1.1
pkgrel=2
pkgdesc="free/open source, small, flexible viewer for PCB-related CAM file formats"
url="http://www.repo.hu/projects/camv-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd4>=4.0.0'
         'freetype2')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('854263afda04c7674caead8cd33f8179356c40bf218954d1582856fc8b2c4ac7')

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
