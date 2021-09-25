# Maintainer: Ben Mitchell <dezyh@outlook.com>
pkgname=patchup
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to compute and apply binary patches for files and directories"
url="https://github.com/patchup/cli"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
provides=("patchup")
conflicts=("patchup-bin")
source=("https://github.com/patchup/cli/releases/download/0.1.0/patchup-cli.tar.gz")
sha256sums=("b3a051474c9e7ffc32006137177db9855a5346d7cf1ae4f69cbaaff72100aecb")

build() {
    cargo build --release --locked --target-dir=target
}

package() {
    install -Dm755 "target/release/patchup" "$pkgdir/usr/bin/patchup"    
}
