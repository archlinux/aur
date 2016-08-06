# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_realname=reacTIVision
pkgname=reactivision
pkgver=1.5.1
pkgrel=1
pkgdesc="A toolkit for tangible multi-touch surfaces"
arch=('i686' 'x86_64')
url="http://reactivision.sourceforge.net/"
license=('GPL')
depends=('libdc1394' 'sdl2')
_srcname="${_realname}-${pkgver}-src"
source=("http://downloads.sourceforge.net/${pkgname}/${_srcname}.zip")
md5sums=('b4a062ff9486c0fb42be2b87e4629ecd')

build() {
    cd "${srcdir}/${_srcname}/linux"
    make
}

package() {
    cd "${srcdir}/${_srcname}/linux"
    make DESTDIR="${pkgdir}/usr/" install

    # move binary to /usr/bin
    install -d "${pkgdir}/usr/bin"
    mv "${pkgdir}/usr/${_realname}" "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 ft=sh et:
