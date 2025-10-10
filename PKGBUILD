# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy
pkgver=0.38.0
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
  'ca926a7315594c4d1686f910d59cae79c6d5a3a76d136a6725dc49f5a5818f8f'
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
  install -D -m644 CONTRIBUTORS.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTORS.md"
}
