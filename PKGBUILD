# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy
pkgver=0.2.7
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
url="https://rbspy.github.io"
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
provides=('rbspy')
conflicts=('rbspy')
source=("https://github.com/rbspy/rbspy/archive/v${pkgver}.tar.gz")
sha512sums=('16b051ca2c838e0b5bab4186ca16ce5a92df278c01e8f94102d732c4f229f2a1edf86855783ca0ef1be71414039f757ce7f22405b11e370efde37288fa7d5f97')

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
