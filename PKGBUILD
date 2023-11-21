pkgname=openmohaa
pkgver=0.60.1
pkgrel=1
pkgdesc="Open re-implementation of Medal of Honor: Allied Assault "
arch=('i686' 'x86_64')
url="https://github.com/openmoh/openmohaa"
license=('GPL2')
depends=()
makedepends=('cmake' 'ninja')
source=("https://github.com/openmoh/openmohaa/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6569b8ffa61370fe3b4c4895e1129423d70addb650c53d36fd254725db0a729d')

build() {
  cd $pkgname-$pkgver
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  
  cmake -G Ninja ../
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

