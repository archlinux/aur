pkgname="lnn"
pkgver="0.1.6"
pkgrel=1
pkgdesc="A tool to hardlink directories"
arch=("any")
url="https://github.com/JanzenJohn/lnn"
license=("GPL")
makedepends=("rust" "git" "wget" "tar")
source=("https://github.com/JanzenJohn/lnn/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("39fbdb254cd8ce9089e467aaf6a7309cd23a488998b3f1af4f60d79d00fd9104")

build() {
    cd lnn-$pkgver
    cargo build --release
    ./test.sh
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp lnn-$pkgver/target/release/lnn $pkgdir/usr/bin/lnn
}
