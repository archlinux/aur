# Maintainer: Josh Andrews <coding@joshandrews.xyz>
pkgname=hyprsession
pkgver=0.2.0
pkgrel=4
pkgdesc="Saves hyprland sessions"
arch=('x86_64')
url="https://github.com/joshurtree/hyprsession"
license=('GPL-3.0-or-later')
depends=()
makedepends=('rust' 'cargo')
source=("-.tar.gz::https://github.com/joshurtree/hyprsession/archive/refs/tags/v.tar.gz")
sha256sums=('17485082b93ee691a42c3de61ee632d1d67be3f0cadc2f11c3287e34552b420f')

build() {
  cd "-"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "-"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "-"
  install -Dm755 "target/release/" "/usr/bin/"
  install -Dm644 "README.md" "/usr/share/doc//README.md"
  install -Dm644 "LICENSE" "/usr/share/licenses//LICENSE"
}
