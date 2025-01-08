# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: ValHue <vhuelamo at gmail dot com>

pkgname="supercat"
pkgver="0.5.8"
pkgrel="2"
pkgdesc="A program that colorizes text based on matching regular expressions/strings/characters."
url="http://supercat.nosredna.net/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('glibc')
provides=("spc")
source=("http://supercat.nosredna.net/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3c017bb42d9d599302a78953abfabdd4d4d91e371292507cd44020f0c8cb6b2a')

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
