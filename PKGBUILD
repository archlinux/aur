# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=fortune-mod-metalgear
pkgver=2110081421
pkgrel=1
pkgdesc="Fortune quotes from Metal Gear"
_filename="metalgear"
arch=('any')
license=('custom:cc-sa-3.0')
url="http://en.wikiquote.org/wiki/Metal_Gear"
depends=('fortune-mod')
makedepends=('fortune-mod' 'wikiquote-fortune')

build()
{
    cd "${srcdir}"
    wikiquote-fortune Metal_Gear
    mv quotes ${_filename}
    strfile ${_filename}
}

package()
{
    cd "${srcdir}"
    install -dm755 -- "${pkgdir}/usr/share/fortune"
    install -m644 -- ${_filename} ${_filename}.dat "${pkgdir}/usr/share/fortune"
}

