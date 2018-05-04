#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=scientifica-bdf
_gitname=scientifica
pkgver=1.1
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
    bdftopcf -o "$srcdir/$_gitname/regular/scientifica-11.pcf" "$srcdir/$_gitname/regular/scientifica-11.bdf"
    bdftopcf -o "$srcdir/$_gitname/bold/scientificaBold-11.pcf" "$srcdir/$_gitname/bold/scientificaBold-11.bdf"
    bdftopcf -o "$srcdir/$_gitname/italic/scientificaItalic-11.pcf" "$srcdir/$_gitname/italic/scientificaItalic-11.bdf"
}

package() {
    install -D -m644 "$srcdir/$_gitname/regular/scientifica-11.pcf" "$pkgdir/usr/share/fonts/misc/scienfica-11.pcf"
    install -D -m644 "$srcdir/$_gitname/bold/scientificaBold-11.pcf" "$pkgdir/usr/share/fonts/misc/scienficaBold-11.pcf"
    install -D -m644 "$srcdir/$_gitname/italic/scientificaItalic-11.pcf" "$pkgdir/usr/share/fonts/misc/scienficaItalic-11.pcf"
    install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
