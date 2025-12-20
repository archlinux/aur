# Maintainer: mfw <espadonne@outlook.com>

pkgname=ferp
pkgver=0.8.7
pkgrel=1
pkgdesc='A GNU grep clone written in Fortran'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/ferp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'pcre2')
makedepends=('gcc-fortran' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortranGoingOnForty/ferp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c40e7670c8ac7631c921e47fb304ba383d567046803d40bfe008506f31f0f255')

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
