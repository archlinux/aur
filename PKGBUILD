# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=safu
pkgver=0.58.4
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
sha256sums=('34136e6aac052310206db7f2320d7174bcca5254e3405ec64baea19b07f9655a')
