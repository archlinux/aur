# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)
# adpoted from mOLOk since pkgver=0.7

pkgname=xcalib
pkgver=0.9
pkgrel=1
pkgdesc="A tiny monitor calibration loader for X.org"
arch=('i686' 'x86_64')
url="https://github.com/OpenICC/xcalib"
license=('GPL2')
depends=('libxxf86vm' 'libxrandr')
makedepends=('git')
source=(${pkgname}::"git://github.com/OpenICC/xcalib.git")
sha256sums=('SKIP')

build() {
    cd ${pkgname}
    make
}

package() {
    cd ${pkgname}
    install -d ${pkgdir}/usr/{share/xcalib,bin}
    install -m755 xcalib "${pkgdir}/usr/bin"
    install -m644 *.icc *.icm "${pkgdir}/usr/share/xcalib/"
}
