# Maintainer: Polarian <polarian@polarian.dev>

name="eureka"
version="2.0.0"
pkgbase="eureka-notes"
pkgname="eureka-notes"
pkgver="v$version"
pkgrel=1
pkgdesc="CLI tool which allows you to quickly write down ideas using your preferred editor"
arch=("x86_64")
url="https://github.com/simeg/$name"
license=("MIT")
makedepends=("rust" "git")
optdepends=("vi: Default text editor used by Eureka")
source=("https://github.com/simeg/$name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e874549e1447ee849543828f49c4c1657f7e6cfe787deea13d44241666d4aaa0')

build() {
    cd "$srcdir/$name-$version"
    cargo build --release
}

package() {
    install -Dm755 "$srcdir/$name-$version/target/release/$name" "$pkgdir/usr/bin/$name"
}
