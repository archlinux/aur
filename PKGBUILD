pkgname="blokator"
pkgver=0.5.0
pkgrel=1
pkgdesc="Simple system-wide adblocker"
url="https://gitlab.com/Tomkoid/blokator"
arch=("x86_64")
makedepends=("rustup")
optdepends=("android-tools: push hosts file to your Android device")
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
