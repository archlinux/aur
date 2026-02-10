# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=cmake-modules-webos-git
pkgrel=1
pkgver=20260210
pkgdesc='CMake modules needed to build Open webOS components'
arch=(i686 x86_64)
url='https://github.com/openwebos/cmake-modules-webos'
license=('Apache-2.0')
provides=('cmake-modules-webos')
depends=('cmake')
makedepends=('git')
sha256sums=('SKIP')

source=(git+https://github.com/openwebos/cmake-modules-webos)

build() {
  rm -rf "$srcdir/build/"
  mkdir "$srcdir/build/"
  cd "$srcdir/build/"
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ../cmake-modules-webos
  make
}

package() {
  cd "$srcdir/build/"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  date '+%Y%m%d'
}
