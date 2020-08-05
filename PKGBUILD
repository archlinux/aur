# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=boston-icon-theme
pkgver=0.8
pkgrel=1
_gitname=Boston-Icons
_gitrel=b2414c02c95a9aaa8a8ad7a029fe9a41e72da667
_upname=Boston
pkgdesc="A highly minimalist icon theme, with a sober color palette inspired on basic hues and forms."
arch=('any')
url="https://www.opendesktop.org/p/1012402"
license=('CCPL:by-sa')
source=("https://github.com/heychrisd/$_gitname/archive/$_gitrel.tar.gz")
sha256sums=('e65f7934ff9514e37db64c914dec624da6d8c9d790adb46a2ef542a736c69a54')
options=(!emptydirs)

package() {
    cd "$srcdir/${_gitname}-${_gitrel}"

    install -d -m755 $pkgdir/usr/share/licenses/$pkgname
    install -D -m644 license $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 third-party $pkgdir/usr/share/licenses/$pkgname/third-party

    install -d -m755 $pkgdir/usr/share/doc/$pkgname
    install -D -m644 patrons.md $pkgdir/usr/share/doc/$pkgname/patrons.md
    install -D -m644 changelog $pkgdir/usr/share/doc/$pkgname/CHANGELOG

    install -d -m755 $pkgdir/usr/share/icons/$_upname
    for size in 16 48 128 legacy symbolic; do
        mv $size "$pkgdir/usr/share/icons/${_upname}/$size"
    done
    install -D -m644 index.theme "$pkgdir/usr/share/icons/${_upname}/index.theme"
}
