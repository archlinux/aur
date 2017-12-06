# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Angus Gibson <darthshrine@gmail.com>

pkgname=cfunge
pkgver=0.9.0
pkgrel=3
pkgdesc='Fast, small and standard conforming Befunge98 interpreter'
arch=('x86_64' 'i686')
url='https://github.com/VorpalBlade/cfunge/'
license=('GPL')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/VorpalBlade/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('bc670123064ea8b75acc1fbba1559cfe3f28d62bd56e5455c9e0fe660474d53a')

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
