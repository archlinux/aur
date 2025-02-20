# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=iso-commander
pkgver=5.7.0
pkgrel=2
pkgdesc='The Fastest ISO Manager on the Planet, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/iso-commander"
license=('GPL3')
depends=('coreutils' 'glibc' 'readline' 'util-linux')
makedepends=('gcc' 'make')
md5sums=('f1564a5f2917570e301ac01f878d5c47')

# The source now includes the binary tarball from your release
source=("$pkgname-$pkgver.tar.gz::https://github.com/siyia2/iso-commander/archive/v$pkgver.tar.gz")

# Skip building, as we are using the precompiled binary
build() {
    return 0  # No build needed
}

package() {
    cd "${srcdir}/$pkgname-${pkgver}"
    # Install the prebuilt binary instead of compiling it
    install -Dm755 "$pkgname-${pkgver}/bin/isocmd" "$pkgdir/usr/bin/isocmd"
    
    # Install the man page
    install -Dm644 "$pkgname-${pkgver}/man/isocmd.1" "$pkgdir/usr/share/man/man1/isocmd.1"
    mandb
}
