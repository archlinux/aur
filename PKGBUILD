# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=fortune-mod-houseofcards
pkgver=1.0.5
pkgrel=2
pkgdesc='Fortune quotes from "House of Cards".'
arch=('any')
license=('custom:PublicDomain')
install="$pkgname.install"
makedepends=('bsd-games') # for rot13
depends=('fortune-mod')
groups=('fortune-mods')
_name='houseofcards'
source=("$_name.txt")
sha256sums=('56059cf4a9d14084e9826e4968958b1c3bd47ee464d5d6c209872df1e264ade1')

build() {
    cd "$srcdir"
    rot13 < "$_name.txt" > "$_name"
    strfile -x "$_name" "$_name.dat"
}

package() {
    install -D -m644 "$srcdir/$_name" "$pkgdir/usr/share/fortune/$_name"
    install -D -m644 "$srcdir/$_name.dat" "$pkgdir/usr/share/fortune/$_name.dat"
}

