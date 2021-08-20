# Maintainer: PryosCode <info@pryoscode.net>
pkgname="toru"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="Pacman wrapper with AUR support."
arch=("x86_64")
url="https://github.com/PryosCode/toru"
license=("Apache-2.0")
depends=(
    "sudo"
    "pacman"
    "git"

    "autoconf"
    "automake"
    "binutils"
    "bison"
    "fakeroot"
    "file"
    "findutils"
    "flex"
    "gawk"
    "gcc"
    "gettext"
    "grep"
    "groff"
    "gzip"
    "libtool"
    "m4"
    "make"
    "patch"
    "pkgconfig"
    "sed"
    "texinfo"
    "which"
)
makedepends=("cargo")
source=("https://github.com/PryosCode/toru/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("SKIP")

build() {
    cd $pkgname-$pkgver
    cargo build --release
}

package() {
    mkdir -p $pkgdir/usr/bin/
    mv $pkgname-$pkgver/target/release/toru $pkgdir/usr/bin/
}