# Maintainer: tblFlip <root@tblflip.de>

pkgname=peldd
pkgver=0.3.0
pkgrel=1
pkgdesc="DLL dependency resolver for PE32(+) executables"
arch=(x86_64)

url="https://git.tblflip.de/root/peldd"
license=("MIT")

optdepends=("wine: Windows system DLLs")
source=("$pkgname-v$pkgver.tar.gz::https://git.tblflip.de/root/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")

sha256sums=(
	"d07b2445eae8e44a454d53985d045bf4b6a9e3dd2782dbbb7dfc112857b32d82"
)

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make install "PREFIX=$pkgdir"
}
