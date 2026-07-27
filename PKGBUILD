# Maintainer: mfw <espadonne@outlook.com>

pkgname=ferp
pkgver=0.10.0
pkgrel=1
pkgdesc='A GNU grep clone written in Fortran'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/ferp'
license=('MIT')
depends=('glibc' 'gcc-libs' 'pcre2')
makedepends=('gcc-fortran' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortranGoingOnForty/ferp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('039821e46c045f328150cc5f4ad1f79f97a50aaf8007273a7f2030eb033c0653')

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
