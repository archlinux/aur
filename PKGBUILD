# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=safu
pkgver=0.64.4
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
sha256sums=('2d7ca2881ea1e22c65763fa1ac149920fd15ce7f86c9de023d77fa9b27f20242')
