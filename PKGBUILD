pkgname="blokator"
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple system-wide adblocker"
url="https://gitlab.com/Tomkoid/blokator"
arch=("x86_64")
makedepends=("rustup")
license=("GPL3")
source=("git+https://gitlab.com/Tomkoid/blokator")
sha512sums=("SKIP")

build() {
  cd "$srcdir/blokator"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/blokator/target/release/blokator" "${pkgdir}/usr/bin/blokator"
}
