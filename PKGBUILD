# Maintainer: mfw <espadonne@outlook.com>

pkgname=fuss
pkgver=1.0.4
pkgrel=1
pkgdesc='A tree utility for dirty git files, written in modern Fortran'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/FortranGoingOnForty/fuss'
license=('MIT')
depends=('glibc' 'git')
makedepends=('gcc-fortran' 'make')
source=("https://github.com/FortranGoingOnForty/fuss/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08847292bbade070944423c5168745d6dabf1091f7cf0d859ded2b53fca5cf65')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"

    # Install main binary
    install -Dm755 fuss "$pkgdir/usr/bin/fuss"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
