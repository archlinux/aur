# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Angus Gibson <darthshrine@gmail.com>

pkgname=cfunge
pkgver=0.9.0
pkgrel=2
pkgdesc='Fast, small and standard conforming Befunge98 interpreter'
arch=('x86_64' 'i686')
url='https://sourceforge.net/projects/cfunge/'
license=('GPL')
makedepends=('cmake' 'ninja')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('4e0e1616970045506995bf1d916863ada91ce9def18eca90ad1ae42525a80261')

build() {
  mkdir -p build
  cd build
  cmake \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    "../$pkgname-$pkgver"
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
