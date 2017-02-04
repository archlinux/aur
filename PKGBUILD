# Maintainer: tPenguinLTG <tpenguinltg@hotmail.com>
pkgname=fortune-mod-foxtrot
pkgver=1701191814
pkgrel=1
_ver=1
pkgdesc="Fortune quotes from FoxTrot"
arch=('any')
license=('custom:cc-sa-3.0')
url="http://en.wikiquote.org/wiki/FoxTrot"
depends=('fortune-mod')
makedepends=('wikiquote-fortune>=1.4')
source=()
sha256sums=()

pkgver()
{
    wikiquote-fortune FoxTrot date-only >/dev/null &&
    cat version
}

build()
{
    wikiquote-fortune FoxTrot
    mv quotes foxtrot
    strfile foxtrot
}

package()
{
    cd "${srcdir}"
    install -dm755 -- "${pkgdir}/usr/share/fortune"
    install -m644 -- foxtrot foxtrot.dat "${pkgdir}/usr/share/fortune"
}
