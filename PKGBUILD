# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributor: nofxx <x@nofxx.com>

pkgname=vncrack
pkgver=1.21
pkgrel=2
pkgdesc="Online/Offline VNC password cracker."
arch=('i686' 'x86_64')
url="http://phenoelit-us.org/vncrack"
license=('GPL')
provides=('vncrack')
source=("${pkgname}.tar.gz::http://www.phenoelit.org/${pkgname}/${pkgname}_src-${pkgver}.tar.gz")
md5sums=('4e19a6f4311b1fd99274f587ca51e920')
PKGEXT='.pkg.tar'

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
