pkgname=haxor-font-git
pkgver=r46.1141244
pkgrel=1
pkgdesc='Haxor Terminal bitmap fonts'
url=https://github.com/metan-ucw/fonts
source=("$pkgname::git+https://github.com/metan-ucw/fonts")
sha256sums=('SKIP')
licence=('GPL2')
arch=('any')
makedepends=('git')

pkgver() {
    cd "$srcdir/$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "$srcdir/$pkgname"

    install -d -m755 "$pkgdir/usr/share/fonts/haxor/"
    install -D -m644 Haxor*.bdf "$pkgdir/usr/share/fonts/haxor/"
    install -D -m644 Haxor*.pcf "$pkgdir/usr/share/fonts/haxor/"
    install -D -m644 fonts.dir "$pkgdir/usr/share/fonts/haxor/"
}
