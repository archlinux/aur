pkgname=bfree
pkgver=0.1.13
pkgrel=1
pkgdesc="bfree - memory stats for humans"
arch=('x86_64')
url="https://github.com/glexposito/bfree"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("https://github.com/glexposito/bfree/archive/refs/tags/v0.1.13.tar.gz")
sha256sums=('96b5d5fb37ff8e07da916a3112e293d49c5ea332700129e8065c3f17a09facc2')

build() {
  cd "${srcdir}/bfree-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/bfree-${pkgver}"
  install -Dm755 target/release/bfree "${pkgdir}/usr/bin/bfree"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
