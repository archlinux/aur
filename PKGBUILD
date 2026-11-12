# Contributor: morning_star <livef3@aol.com>

pkgname=kbtin
pkgver=2.3
pkgrel=1
pkgdesc="Very heavily extended clone of well-known TinTin++"
arch=('x86_64')
url="https://github.com/kilobyte/kbtin"
license=('GPL-2.0-or-later')
depends=('zlib' 'gnutls' 'hyperscan')
makedepends=('cmake' 'perl' 'valgrind')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('40f7e3f044f66493e31f72529e31a9044826b0bb79287eb54c85e74599d2626b9d4b7e998cc8e98482f21361e718025d606d179db83fb35e4c71e5a36c71bc8e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
