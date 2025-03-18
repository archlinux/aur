# Maintainer: Nakidai <nakidai at disroot dot org>
pkgname=getlayout
pkgdesc="Print current layout in Xorg"
url="https://github.com/nakidai/mycfetch"
license=("BSD-2-Clause")

pkgver=1.1
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc" "libx11" "libxkbfile")

source=("https://github.com/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a26ec89a196f400fff327d7dec8c8127dd394687c0c25056fee38290072a92e1')

build() {
    cd "$pkgname-$pkgver"
    make clean all
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    make PREFIX="$pkgdir/usr/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
