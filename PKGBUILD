pkgname=bfree
pkgver=0.1.16
pkgrel=1
pkgdesc="bfree - memory stats for humans"
arch=('x86_64')
url="https://github.com/glexposito/bfree"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("https://github.com/glexposito/bfree/archive/refs/tags/v0.1.16.tar.gz")
sha256sums=('4c49c231597b730bc185fc28cf7548a7f0e9941f40035ff9d757c2d696b6d8ec')

build() {
  cd "${srcdir}/bfree-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/bfree-${pkgver}"
  install -Dm755 target/release/bfree "${pkgdir}/usr/bin/bfree"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
