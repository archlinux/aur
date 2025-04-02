# Contributor: morning_star <livef3@aol.com>

pkgname=kbtin
pkgver=2.1
pkgrel=2
pkgdesc="Very heavily extended clone of well-known TinTin++"
arch=('x86_64')
url="https://github.com/kilobyte/kbtin"
license=('GPL-2.0-or-later')
depends=('zlib' 'gnutls' 'hyperscan')
makedepends=('cmake' 'perl' 'valgrind')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('94b3b07381b6b8f37b14266d37f574a9b2381fcbe8bc2ae0a15cec6e25c435d973012486230fe036acb4b42bc2e231a730b8fc9153d7834e9acbaf0a264168ff')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
