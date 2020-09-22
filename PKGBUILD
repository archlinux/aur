# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_pkgbase=akvcam
pkgname=${_pkgbase}-dkms
pkgver=1.1.0
pkgrel=3
pkgdesc="Virtual camera for Linux"
url="https://github.com/webcamoid/akvcam"
arch=('any')
license=('GPL2')
depends=('dkms')
source=("https://github.com/webcamoid/${_pkgbase}/archive/${pkgver}.tar.gz")
md5sums=('22e54cacef55af98fe05f180217dae4c')

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cp -vf COPYING "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgbase}"
    cp -vf COPYING "${pkgdir}/usr/share/licenses/${_pkgbase}"
    mkdir -p "${pkgdir}/etc/${_pkgbase}/examples"
    cp -vf share/config_example.ini "${pkgdir}/etc/${_pkgbase}"
    cp -vf share/examples/output.c "${pkgdir}/etc/${_pkgbase}/examples"
    cd "${srcdir}/${_pkgbase}-${pkgver}/src"
    cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
