# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=enchantum-git
pkgver=0.3.0.r53.g8ca5b0e
pkgrel=1
pkgdesc="Faster enum reflection for C++17 since I don't want to wait for C++26 reflection."
arch=('any')
url="https://github.com/ZXShady/enchantum"
license=('MIT')
depends=()
makedepends=('git' 'cmake')
source=("git+https://github.com/ZXShady/enchantum.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/enchantum"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  cd "$srcdir/enchantum"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
}

package() {
  cd "$srcdir/enchantum/build"
  cmake --install .
}

