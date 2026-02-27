pkgname=bfree
pkgver=0.1.6
pkgrel=1
pkgdesc="A better free, human by default"
arch=('x86_64')
url="https://github.com/glexposito/bfree"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("https://github.com/glexposito/bfree/archive/refs/tags/v0.1.6.tar.gz")
sha256sums=('4986866c2bac2743f0ac24a5abf796ef5ac40055d4e95692e1f5279100190b75')

build() {
  cd "${srcdir}/bfree-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/bfree-${pkgver}"
  install -Dm755 target/release/bfree "${pkgdir}/usr/bin/bfree"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
