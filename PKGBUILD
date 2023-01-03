# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=camv-rnd
pkgver=1.1.0
pkgrel=2
pkgdesc="free/open source, small, flexible viewer for PCB-related CAM file formats"
url="http://www.repo.hu/projects/camv-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd3>=3.1.1'
         'freetype2')
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('0efc77c4d40634cc19551348680f0b9b67157a88c1cead4465ac3a05bae9cfe9')

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
