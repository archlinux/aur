# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=fortune-mod-houseofcards
pkgver=1.0.7
pkgrel=1
pkgdesc='Fortune quotes from "House of Cards".'
arch=('any')
license=('custom:PublicDomain')
install="$pkgname.install"
makedepends=('bsd-games') # for rot13
depends=('fortune-mod')
groups=('fortune-mods')
_name='houseofcards'
source=("$_name.txt")
sha512sums=('354b9b9eb098f8275a8d3898ddeaa7168b1fba6169e1eaa1ce03376d5c2cccb10371160d2dfa3bf3bbcd93c44536d85b33049a3191d65fdd3c8c3c21f5a26b8e')

build() {
    cd "$srcdir"
    rot13 < "$_name.txt" > "$_name"
    strfile -x "$_name" "$_name.dat"
}

package() {
    install -D -m644 "$srcdir/$_name" "$pkgdir/usr/share/fortune/$_name"
    install -D -m644 "$srcdir/$_name.dat" "$pkgdir/usr/share/fortune/$_name.dat"
}

