pkgname="lnn"
pkgver="0.1.5"
pkgrel=1
pkgdesc="A tool to hardcopy directories"
arch=("any")
url="https://github.com/JanzenJohn/lnn"
license=("GPL")
makedepends=("rust" "git" "wget" "tar")
source=("https://github.com/JanzenJohn/lnn/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("a7cc65e586bf9925caac847fa0d3a39fb3ff0fcb183c0df6b7661673fdea9e34")

build() {
    cd lnn-$pkgver
    cargo build --release
    ./test.sh
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp lnn-$pkgver/target/release/lnn $pkgdir/usr/bin/lnn
}
