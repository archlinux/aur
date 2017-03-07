# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=fortune-mod-houseofcards
pkgver=1.0.5
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
sha256sums=('d91d8566aec2db8365e372e75ffd8c647453dea8d077eeebe734d2592814525e')

build() {
    cd "$srcdir"
    rot13 < "$_name.txt" > "$_name"
    strfile -x "$_name" "$_name.dat"
}

package() {
    install -D -m644 "$srcdir/$_name" "$pkgdir/usr/share/fortune/$_name"
    install -D -m644 "$srcdir/$_name.dat" "$pkgdir/usr/share/fortune/$_name.dat"
}

