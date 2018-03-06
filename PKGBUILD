# Maintainer: ValHue <vhuelamo at gmail dot com>
#
pkgname="supercat"
pkgver="0.5.6"
pkgrel="5"
pkgdesc="A program that colorizes text based on matching regular expressions/strings/characters."
url="http://supercat.nosredna.net/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('glibc')
provides=("${pkgname}")
source=("http://supercat.nosredna.net/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0b2052237acc7754094caca4ed85f7e9fa55139f801de2f210c328ead7a33211')

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

# vim:set ts=4 sw=2 ft=sh et:
