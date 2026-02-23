pkgname=bfree
pkgver=0.1.4
pkgrel=1
pkgdesc="A better free, human by default"
arch=('x86_64')
url="https://github.com/glexposito/bfree"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("https://github.com/glexposito/bfree/archive/refs/tags/v0.1.4.tar.gz")
sha256sums=('5ee7d38f08351371e825495fe48901d9dabaa694a7cf4bb35375b176129cbf5e')

build() {
  cd "${srcdir}/bfree-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/bfree-${pkgver}"
  install -Dm755 target/release/bfree "${pkgdir}/usr/bin/bfree"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
