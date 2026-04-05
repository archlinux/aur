# Maintainer: Tian Yuxuan (Friendships666) <tianfs6x@gmail.com>
pkgname=stuplot
pkgver=1.0.0
pkgrel=1
pkgdesc="High-performance C++23 header-only plotting engine based on IA and DE"
arch=('any')
url="https://github.com/Friendships6666/StuPlot"
license=('MIT')
depends=()
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('090700c2cbe53170d2dee7115e7e234dd4e67cff8be7f6774071609f298ce852')

build() {
  cmake -B build -S "StuPlot-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSTUPLOT_BUILD_EXAMPLES=OFF
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "StuPlot-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
