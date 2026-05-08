pkgname=bfree
pkgver=0.1.15
pkgrel=1
pkgdesc="bfree - memory stats for humans"
arch=('x86_64')
url="https://github.com/glexposito/bfree"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("https://github.com/glexposito/bfree/archive/refs/tags/v0.1.15.tar.gz")
sha256sums=('af14829ea081182ad4947c3d7165567e6bc64432a85e4aa03d956c9495cf0ecc')

build() {
  cd "${srcdir}/bfree-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/bfree-${pkgver}"
  install -Dm755 target/release/bfree "${pkgdir}/usr/bin/bfree"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
