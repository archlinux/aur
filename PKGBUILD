# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=fortune-mod-acecombat
pkgver=2012130332
pkgrel=1
pkgdesc="Fortune quotes from Ace Combat"
_title="Ace_Combat"
_filename="acecombat"
arch=('any')
license=('custom:cc-sa-3.0')
url="http://en.wikiquote.org/wiki/${_title}"
depends=('fortune-mod')
makedepends=('fortune-mod' 'wikiquote-fortune')

build()
{
    cd "${srcdir}"
    wikiquote-fortune ${_title}
    mv quotes ${_filename}
    strfile ${_filename}
}

package()
{
    cd "${srcdir}"
    install -dm755 -- "${pkgdir}/usr/share/fortune"
    install -m644 -- ${_filename} ${_filename}.dat "${pkgdir}/usr/share/fortune"
}


