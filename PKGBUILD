# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=fortune-mod-houseofcards
pkgver=1.0.3
pkgrel=1
pkgdesc='Fortune quotes from "House of Cards".'
arch=('any')
license=('unknown')
install="$pkgname.install"
makedepends=('bsd-games') # for rot13
depends=('fortune-mod')
groups=('fortune-mods')
_name='houseofcards'
source=("$_name.txt")
sha256sums=('42bebc705c9ca8d50ca9af16ba50298473768fc85ae505a0b29d16fc867d3d23')

build() {
    cd "$srcdir"
    rot13 < "$_name.txt" > "$_name"
    strfile -x "$_name" "$_name.dat"
}

package() {
    install -D -m644 "$srcdir/$_name" "$pkgdir/usr/share/fortune/$_name"
    install -D -m644 "$srcdir/$_name.dat" "$pkgdir/usr/share/fortune/$_name.dat"
}

