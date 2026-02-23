pkgname=bfree
pkgver=0.1.5
pkgrel=1
pkgdesc="A better free, human by default"
arch=('x86_64')
url="https://github.com/glexposito/bfree"
license=('MIT')
depends=('glibc')
makedepends=('cargo')
source=("https://github.com/glexposito/bfree/archive/refs/tags/v0.1.5.tar.gz")
sha256sums=('321734065d5b4e596b74614747a1c59d58e891a92ab53525b677aaeaba76171a')

build() {
  cd "${srcdir}/bfree-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/bfree-${pkgver}"
  install -Dm755 target/release/bfree "${pkgdir}/usr/bin/bfree"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
