# Maintainer: Vasya Novikov <vnnn91@yandex.ru> (replace "nnn" with a single "n")
# Contributor: gato_lento
# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)
# adpoted from mOLOk since pkgver=0.7

pkgname=xcalib
pkgver=0.10
pkgrel=2
pkgdesc="A tiny monitor calibration loader for X.org"
arch=('i686' 'x86_64')
url="https://github.com/OpenICC/xcalib"
license=('GPL2')
depends=('libxxf86vm' 'libxrandr')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('67dbf2dcc4ae67fde48b48630980c1fa6f89fda5810347f616ec85094c274055')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}"/usr/{share/xcalib,share/man/man1,bin}
    install -m755 xcalib "${pkgdir}/usr/bin"
    install -m644 -- *.icc *.icm "${pkgdir}/usr/share/xcalib/"
    install -m644 -- *.1 "${pkgdir}/usr/share/man/man1/"
}

