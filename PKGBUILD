# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="supercat"
pkgver="0.5.7"
pkgrel="1"
pkgdesc="A program that colorizes text based on matching regular expressions/strings/characters."
url="http://supercat.nosredna.net/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('glibc')
provides=("${pkgname}")
source=("http://supercat.nosredna.net/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ecc0f34117733bdac617e0ad6623622c68ef791059899750bd1d90012a058a50')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix /usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
