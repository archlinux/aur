pkgname=fltrdr
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI text reader for the terminal"
arch=("x86_64")
url="https://github.com/octobanana/$pkgname"
license=("MIT")
depends=()
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("b29011f687a141cae482983a4f9230861731fed035298e967c004398fa770505");

build(){
    cd "$pkgname-$pkgver"
    ./build.sh --release
}

package(){
    cd "$srcdir/$pkgname-$pkgver/build/release"
    make DESTDIR="$pkgdir/" install
}

