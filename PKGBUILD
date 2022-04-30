# Maintainer: dingjing <dingjing@live.cn>

pkgname=graceful-greeter
pkgver=2.0.0
pkgrel=1
pkgdesc='A beautiful lightDM login interface'
url='https://github.com/graceful-linux/graceful-greeter'
arch=('x86_64')
license=('MIT')
groups=('graceful')
depends=('imlib2' 'lightdm' 'libxrandr' 'libxtst' 'opencv' 'qt5-svg' 'qt5-x11extras')
makedepends=('qt5-tools' 'openmpi' 'cmake')
source=("https://github.com/graceful-linux/graceful-greeter/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('27b3733a45b874a834acd2b6c3248bbb645baa4ee9483f7312069831873a95bbd8e6a23843c40cbb3d6cdc15393ce5cca8b3b477ea868fb9bcc42f87bf697a53')

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
