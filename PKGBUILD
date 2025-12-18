# Maintainer: mfw <espadonne@outlook.com>

pkgname=ferp
pkgver=0.8.0
pkgrel=1
pkgdesc='A GNU grep clone written in Fortran'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/ferp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'pcre2')
makedepends=('gcc-fortran')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortranGoingOnForty/ferp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c0da19c94b5141cebb7bb57226999eccd2cb6f5847dde5b6f64450f5a9cd146')

build() {
    cd "$pkgname-$pkgver"
    make release
}

package() {
    cd "$pkgname-$pkgver"

    # Install main binary
    install -Dm755 "ferp" "$pkgdir/usr/bin/ferp"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
