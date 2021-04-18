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
source=("https://github.com/dezyh/patchup/releases/download/0.1.0/patchup-cli.tar.gz")
sha256sums=("8f572250b48d88415de707d68bca13403c114f1762129ac09d3cf53478554c7d")

build() {
    cargo build --release --locked --target-dir=target
}

package() {
    install -Dm755 "target/release/patchup" "$pkgdir/usr/bin/patchup"    
}
