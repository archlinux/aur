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
sha256sums=("6758abd01595f74d76e0c07322b38d74c0570f8239d52f6e353473e0fad3c388")

build() {
    cargo build --release --locked --target-dir=target
}

package() {
    install -Dm755 "target/release/patchup" "$pkgdir/usr/bin/patchup"    
}
