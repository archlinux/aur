#Maintainer: Rein Fernhout (LevitatingBusinessMan) <public@reinfernhout.xyz>

pkgname=filematch
pkgver=fe26f8a
arch=("x86_64")
pkgrel=1
pkgdesc="A CLI program to compare checksums of folders and files"
license=("MIT")
makedepends=("cargo" "git")
url="https://github.com/LevitatingBusinessMan/filematch"
source=("git+https://github.com/LevitatingBusinessMan/filematch.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkgname}"
	git rev-parse --short HEAD
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release
}

package() {
    install -Dm755 $srcdir/$pkgname/target/release/filematch $pkgdir/usr/bin/filematch
    install -Dm644 $srcdir/$pkgname/LICENSE $pkgdir/usr/share/licenses/filematch/LICENSE
}
