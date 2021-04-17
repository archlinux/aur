# Maintainer: Ben Mitchell <dezyh@outlook.com>
pkgname=patchup
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to compute and apply binary patches for files and directories"
url="https://github.com/dezyh/patchup"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
provides=("patchup")
conflicts=("patchup-bin")
source=("patchup-0.1.0::https://github.com/dezyh/patchup/releases/download/0.1.0/patchup-cli.tar.gz")
sha256sums=("38f9080173e56982c822be56fe1dfe0db4b8862b30c2ec3fbf63e63e0e0644d6")

build() {
    cd "patchup-0.1.0"
    cargo build --release --locked --target-dir=target
}

package() {
    cd "patchup-0.1.0"
    install -Dm755 "target/release/patchup" "$pkgdir/usr/bin/patchup"    
}
