# Maintainer: Josh Andrews <coding@joshandrews.xyz>
pkgname=hyprsession
pkgver=0.2.0
pkgrel=5
pkgdesc="Saves hyprland sessions"
arch=('x86_64')
url="https://github.com/joshurtree/hyprsession"
license=('GPL-3.0-or-later')
depends=()
makedepends=('rust' 'cargo')
source=("-.tar.gz::https://github.com/joshurtree/hyprsession/archive/refs/tags/v.tar.gz")
sha256sums=('ba0c2368e337eff12a08194ebcbe4ec5a21f0a63a84ee6ab85b0adcf836f7a23')

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
