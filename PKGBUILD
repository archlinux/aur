pkgname=bfree
pkgver=0.1.14
pkgrel=1
pkgdesc="bfree - memory stats for humans"
arch=('x86_64')
url="https://github.com/glexposito/bfree"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("https://github.com/glexposito/bfree/archive/refs/tags/v0.1.14.tar.gz")
sha256sums=('0d4c98d5c57a8812f1ae857b598d4238ff5507b12ad1034a58357fd7d8627e4d')

build() {
  cd "${srcdir}/bfree-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/bfree-${pkgver}"
  install -Dm755 target/release/bfree "${pkgdir}/usr/bin/bfree"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
