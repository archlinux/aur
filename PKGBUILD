# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy
pkgver=0.2.9
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
url="https://rbspy.github.io"
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
conflicts=('rbspy')

source=("https://github.com/rbspy/rbspy/archive/v${pkgver}.tar.gz")
sha512sums=('4733314da0236530abfd567c829ffd51ac46d3178012d438ee33e6f3212603be2f726029baa44b62f690dd3ef4f6726acf3c462d9ec01321feac5725f4b1c58b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 target/release/rbspy "${pkgdir}/usr/bin/rbspy"
  install -D -m644 License.md "$pkgdir/usr/share/licenses/$pkgname/License.md"
  install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m644 ARCHITECTURE.md "$pkgdir/usr/share/doc/$pkgname/ARCHITECTURE.md"
  install -D -m644 CODE_OF_CONDUCT.md "$pkgdir/usr/share/doc/$pkgname/CODE_OF_CONDUCT.md"
}
