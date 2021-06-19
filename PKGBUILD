# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy
pkgver=0.7.0
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
url="https://rbspy.github.io"
makedepends=('fakeroot' 'cargo')
arch=('x86_64')
license=('MIT')
conflicts=('rbspy')
source=(
  "https://github.com/rbspy/rbspy/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '542f1f872a4434a68f1b3dcb019af1e15aa6e16efe6966a788351240661f50a8'
)

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
