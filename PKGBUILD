# Maintainer: bash0000000 <hidden>

pkgname=gcc-go-no-conflict-with-go
pkgver=14.2.1+r753+g1cd744a6828f
pkgrel=1
pkgdesc="Go front-end for GCC (modified to avoid conflict with go package)"
arch=('x86_64')
url="https://gcc.gnu.org"
license=('GPL-3.0-with-GCC-exception' 'GFDL-1.3-or-later')
depends=("gcc=${pkgver}-${pkgrel}" 'libisl.so=23-64')
conflicts=('gcc-go-multilib' 'gcc-go')
provides=('gcc-go-multilib' 'gcc-go')
# Download official package
source=("gcc-go-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://geo.mirror.pkgbuild.com/core/os/x86_64/gcc-go-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst") 
sha256sums=('dadc5ef71bcd379770393b9c6af92a386a4258328b51b6d209e0162c16fa63ab')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
    # Move conflicting files
    mv "$pkgdir/usr/bin/go" "$pkgdir/usr/bin/gcc-go"
    mv "$pkgdir/usr/bin/gofmt" "$pkgdir/usr/bin/gcc-gofmt"
    mv "$pkgdir/usr/share/man/man1/go.1.gz" "$pkgdir/usr/share/man/man1/gcc-go.1.gz"
    mv "$pkgdir/usr/share/man/man1/gofmt.1.gz" "$pkgdir/usr/share/man/man1/gcc-go.1.gz"
}
