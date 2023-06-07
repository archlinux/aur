pkgname="lnn"
pkgver="0.1.4"
pkgrel=1
pkgdesc="A tool to hardcopy directories"
arch=("any")
url="https://github.com/JanzenJohn/lnn"
license=("GPL")
makedepends=("rust" "git" "wget" "tar")
source=("https://github.com/JanzenJohn/lnn/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("a14cc3be482f065b7c191bc1ef4d5c7f5ab142b007875986c547cc3ab9d28c17")

build() {
    cd lnn-$pkgver
    cargo build --release
    ./test.sh
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp lnn-$pkgver/target/release/lnn $pkgdir/usr/bin/lnn
}
