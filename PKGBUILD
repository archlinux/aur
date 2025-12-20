# Maintainer: mfw <espadonne@outlook.com>

pkgname=ferp
pkgver=0.9.1
pkgrel=1
pkgdesc='A GNU grep clone written in Fortran'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/ferp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'pcre2')
makedepends=('gcc-fortran' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortranGoingOnForty/ferp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22215a544137239defd1a419db88a7bc49bb3d8d2a8728619200992c7b4c5394')

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
