pkgname=bfree
pkgver=0.1.21
pkgrel=1
pkgdesc="bfree - memory stats for humans"
arch=('x86_64')
url="https://github.com/glexposito/bfree"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("https://github.com/glexposito/bfree/archive/refs/tags/v0.1.21.tar.gz")
sha256sums=('e04af55efb4c8cb61c1cdfac1c7d80810b310e9f425fef19166fdbd52b63a68d')

build() {
  cd "${srcdir}/bfree-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/bfree-${pkgver}"
  install -Dm755 target/release/bfree "${pkgdir}/usr/bin/bfree"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
