# Maintainer: Richard Bradfield <bradfier at fstab dot me>

pkgname=xd-rs
pkgver=0.0.4
pkgrel=1
pkgdesc="xd - A tool to dump binary input in a variety of formats"
url="https://bitbucket.org/delan/xd"
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("xd")
arch=("i686" "x86_64")
license=("ISC")
source=("git+https://bitbucket.org/delan/xd.git#tag=$pkgver")
sha512sums=("SKIP")

build() {
    cd xd
    cargo build --release --target-dir "./target"
}

check() {
    cd xd
    cargo test --release --target-dir "./target"
}

package() {
    cd xd
    install -Dm755 "target/release/xd" "$pkgdir/usr/bin/xd"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/xd-rs/LICENSE.txt"
}
