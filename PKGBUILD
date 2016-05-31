pkgname=aqemu
pkgver=0.9.2
pkgrel=1
pkgdesc="QEMU GUI written in Qt5"
arch=('i686' 'x86_64')
url="https://github.com/tobimensch/aqemu"
license=('GPL2')
depends=('qemu' 'qt5-base' 'libvncserver')
makedepends=('cmake' 'qt5-base')
source=("aqemu-$pkgver.tar.gz::https://github.com/tobimensch/aqemu/archive/v${pkgver}.tar.gz")
md5sums=('cd7f6077a5a49a25450dc007532b0f95')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DQT_QMAKE_EXECUTABLE=qmake4
  make
}

package() {
  
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
