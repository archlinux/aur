# Maintainer: Kairat Kubanychbek uulu <https://github.com/ImKairat>

pkgname=gitflow
pkgver=1.0.0_beta.1
pkgrel=1
pkgdesc="Gitflow is a Git extension that implements the Gitflow AVH branching model."
arch=('x86_64' 'aarch64')
url="https://github.com/ImKairat-Rust-Lab/gitflow"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('gitflow')
conflicts=('gitflow')
options=('!lto')
source=("git+https://github.com/ImKairat-Rust-Lab/gitflow.git#tag=v1.0.0-beta.1")
sha256sums=('SKIP')

build() {
  cd gitflow
  cargo build --release --locked
}

package() {
  cd gitflow
  install -Dm755 "target/release/gitflow" "$pkgdir/usr/bin/gitflow"
}
