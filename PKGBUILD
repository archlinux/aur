# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=safu
pkgver=0.61.0
pkgrel=1
pkgdesc="C to library to reduce boiler plate code when use standard c-libs"
arch=('x86_64')
url="https://github.com/Elektrobit/safu"
license=('MIT')
depends=('glibc' 'json-c')
makedepends=('cmake' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DSAFU_BUILD_DEFAULTS=off \
	.
  make -C build
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('2bd337bc96ffba27d788e69776babd6dcb1b6813b9e7e358f5ec270a663f2b4e')
