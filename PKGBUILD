# Maintainer: danb <danb@hasi.it>
pkgname=rawr
pkgver=0.1
pkgrel=2
pkgdesc="An instant file sharing tool that respects your privacy by not caching any files"
arch=('x86_64')
url="https://gitlab.hasi.it/danb/rawr"
license=('GPL3')
makedepends=('rustup')
source=("git+https://gitlab.hasi.it/danb/rawr")
sha256sums=('SKIP')

build() {
  cd ${pkgname}
  rustup default nightly
  cargo build --release --all-features --target-dir=target
}

check() {
  cd ${pkgname}
  cargo test --release --target-dir=target
}

package() {
  cd ${pkgname}
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
