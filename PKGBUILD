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
sha512sums=('c85ab8fedfd713a26cf7d8105747d0366591dec3d0fafc20f894917090e453d39ea28407da85ec3a65ffea9b8fbd0181965d693d8b4f52c68af32898ef546dad')

build() {
    cd "$srcdir"
    rot13 < "$_name.txt" > "$_name"
    strfile -x "$_name" "$_name.dat"
}

package() {
    install -D -m644 "$srcdir/$_name" "$pkgdir/usr/share/fortune/$_name"
    install -D -m644 "$srcdir/$_name.dat" "$pkgdir/usr/share/fortune/$_name.dat"
}

