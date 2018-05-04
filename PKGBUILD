#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=scientifica-bdf
_gitname=scientifica
pkgver=2.0
pkgrel=1
pkgdesc='Tall and condensed bitmap font for geeks.'
arch=('any')
url="https://github.com/NerdyPepper/scientifica"
license=('SIL')
depends=('')
makedepends=('git' 'xorg-font-utils')
source=('git+https://github.com/NerdyPepper/scientifica.git')
sha256sums=('SKIP')

build() {
    bdftopcf -o "$srcdir/$_gitname/regular/scientifica-11.pcf" scientifica-11.bdf
    bdftopcf -o "$srcdir/$_gitname/bold/scientificaBold-11.pcf" scientificaBold-11.bdf
    bdftopcf -o "$srcdir/$_gitname/italic/scientificaItalic-11.pcf" scientificaItalic-11.bdf
}

package() {
    install -D -m644 "$srcdir/$_gitname/regular/scientifica-11.pcf" "$pkgdir/usr/share/fonts/misc"
    install -D -m644 "$srcdir/$_gitname/bold/scientificaBold-11.pcf" "$pkgdir/usr/share/fonts/misc"
    install -D -m644 "$srcdir/$_gitname/italic/scientificaItalic-11.pcf" "$pkgdir/usr/share/fonts/misc"
    install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
