# Contributor: Max Devaine <maxdevaine@gmail.com>

pkgname=atinout
pkgver=0.9.1
pkgrel=1
pkgdesc='AT commands as input are sent to modem and responses given as output.'
arch=(i686 x86_64)
url='http://atinout.sourceforge.net/'
license=('GPL3')
source=("atinout-${pkgver}.tar.gz::http://sourceforge.net/projects/atinout/files/v${pkgver}/atinout-${pkgver}.tar.gz/download"
        "Makefile.patch")

sha256sums=('4d15c8288aca414e11cd304686b172696104c5e42bf776300311c005634854a2'
            'f6cb07641ba14c5fbe9bd4d92f12050a3d1c83cef9cc8c9d90a6081715f433df')

build() {
    cd ${srcdir}/atinout-$pkgver
    patch -p0  < "${srcdir}/Makefile.patch"
    make
 }

package() {
    cd ${srcdir}/atinout-$pkgver
    install -Dm 755 atinout $pkgdir/usr/bin/atinout
}

