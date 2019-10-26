# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=boston-icon-theme
pkgver=0.6
pkgrel=1
_upname=Boston
_gitname=Boston-Icons
_gitrel=b7a4b17361c4af4c9a440b4d79872e205f40c7db
pkgdesc="A highly minimalist icon theme, with a sober color palette inspired on basic hues and forms."
arch=('any')
url="https://www.opendesktop.org/p/1012402"
license=('CCPL:by-sa')
source=("https://github.com/heychrisd/$_gitname/archive/$_gitrel.tar.gz")
sha256sums=('74f97985442a745d214e9eeef5265f0a5dc0dac7b2343e9b3791be1b75cffe64')
options=(!emptydirs)

package() {
    cd "$srcdir/${_gitname}-${_gitrel}"

    install -d -m755 $pkgdir/usr/share/licenses/$pkgname
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 "THIRD PARTY" $pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY
    install -D -m644 PATRONS.md $pkgdir/usr/share/licenses/$pkgname/PATRONS

    install -d -m755 $pkgdir/usr/share/icons/$_upname
    for size in 16 48 128 legacy symbolic; do
        mv $size "$pkgdir/usr/share/icons/${_upname}/$size"
    done
    install -D -m644 index.theme "$pkgdir/usr/share/icons/${_upname}/index.theme"
}
