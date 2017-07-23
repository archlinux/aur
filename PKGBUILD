# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributor: nofxx <x@nofxx.com>

pkgname=vncrack
pkgver=1.21
pkgrel=3
pkgdesc="Online/Offline VNC password cracker."
arch=('i686' 'x86_64')
url="http://phenoelit-us.org/vncrack"
license=('GPL')
provides=('vncrack')
source=("${pkgname}.tar.gz::http://www.phenoelit.org/${pkgname}/${pkgname}_src-${pkgver}.tar.gz")
sha256sums=('236db9a2a9b3bf5ab70b4aee77f33976b7e5f3f8e1c93c0dcdaa348b2c6cbd3b')

prepare() {
    cd "${srcdir}/libvncauth"
    make clean
}

build() {
    cd "${srcdir}"
    make
}

package() {
    cd "${srcdir}"
    install -Dm755 vncrack "${pkgdir}/usr/bin/vncrack"
}
