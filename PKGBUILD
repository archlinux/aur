# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_realname=reacTIVision
pkgname=reactivision
pkgver=1.5
pkgrel=2
pkgdesc="A toolkit for tangible multi-touch surfaces"
arch=('i686' 'x86_64')
url="http://reactivision.sourceforge.net/"
license=('GPL')
depends=('libdc1394' 'sdl2')
_srcname="${_realname}-${pkgver}-src"
source=("http://downloads.sourceforge.net/${pkgname}/${_srcname}.zip")
md5sums=('5480848dae6bc9e098da5f8e22b0c500')

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
