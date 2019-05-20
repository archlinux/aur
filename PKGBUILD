# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=boston-icon-theme
pkgver=0.3
_gitname=Boston-Icons
_gitrel=33ec2ce838ba7f0eeff43133019b2ce63a6b2171
pkgrel=1
pkgdesc="A highly minimalist icon theme, with a sober color palette inspired on basic hues and forms."
arch=('any')
url="https://www.opendesktop.org/p/1012402"
license=('CCPL:by-sa')
source=("boston-icon-theme.tar.gz::https://github.com/heychrisd/$_gitname/archive/$_gitrel.tar.gz")
sha256sums=('92e46eb026810e9ffdc26b1a3106be49d5c39a16fa8a89573d0492566482fa60')
options=(!emptydirs)

package() {
    install -d -m755 $pkgdir/usr/share/{icons,licenses/$pkgname}

    cd $srcdir
    install -D -m644 "${_gitname}-${_gitrel}/LICENSE" \
            $pkgdir/usr/share/licenses/$pkgname/LICENSE
    mv "${_gitname}-${_gitrel}" "$pkgdir/usr/share/icons/${_gitname}"
}
