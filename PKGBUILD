# Maintainer: dingjing <dingjing@live.cn>

pkgname=graceful-greeter
pkgver=2.0.1
pkgrel=1
pkgdesc='A beautiful lightDM login interface'
url='https://github.com/graceful-linux/graceful-greeter'
arch=('x86_64')
license=('MIT')
groups=('graceful-linux')
depends=('imlib2' 'lightdm' 'libxrandr' 'libxtst' 'opencv' 'qt5-svg' 'qt5-x11extras')
makedepends=('qt5-tools' 'openmpi' 'cmake')
source=("https://github.com/graceful-linux/graceful-greeter/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('5eca42a2ae551ffba3e9c2005ec977e31a55fdc215da51ec1947cc83e45ef16642c841452bdc844612a7d1eacaecd1aa367feff22f9cc64c62c3bb4194efd1fd')

prepare() {
#mv $pkgver "graceful-greeter-$pkgver"
  cd graceful-greeter-$pkgver && mkdir build && cd build 
  cmake ..
}

build() {
  cd graceful-greeter-$pkgver/build
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
