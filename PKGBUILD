# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=fortune-mod-houseofcards
pkgver=1.0.6
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
sha256sums=('0512e3c31e61531deda0f723ee5fcf0aaf3c2212eb2923e97925460662ae84fc')

build() {
    cd "$srcdir"
    rot13 < "$_name.txt" > "$_name"
    strfile -x "$_name" "$_name.dat"
}

package() {
    install -D -m644 "$srcdir/$_name" "$pkgdir/usr/share/fortune/$_name"
    install -D -m644 "$srcdir/$_name.dat" "$pkgdir/usr/share/fortune/$_name.dat"
}

