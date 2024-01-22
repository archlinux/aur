# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_pkgbase=akvcam
pkgname=${_pkgbase}-dkms
pkgver=1.2.5
pkgrel=1
pkgdesc="Virtual camera for Linux"
url="https://github.com/webcamoid/akvcam"
arch=('any')
license=('GPL2')
depends=('dkms')
source=("https://github.com/webcamoid/${_pkgbase}/archive/${pkgver}.tar.gz")
md5sums=('86f5e8f49c63f73b99a6d9b498222ce9')

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}/src"

    make install DESTDIR="${pkgdir}"
    cp -vf "${srcdir}/${_pkgbase}-${pkgver}/COPYING" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgbase}"
    cp -vf "${srcdir}/${_pkgbase}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgbase}"
    mkdir -p "${pkgdir}/etc/${_pkgbase}/examples"
    cp -vf "${srcdir}/${_pkgbase}-${pkgver}/share/config_example.ini" "${pkgdir}/etc/${_pkgbase}"
    cp -vf "${srcdir}/${_pkgbase}-${pkgver}/share/examples/output.c" "${pkgdir}/etc/${_pkgbase}/examples"
}
