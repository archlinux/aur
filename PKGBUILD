# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_pkgbase=openhab3
pkgname=${_pkgbase}-addons
pkgver=3.2.0
pkgrel=1
pkgdesc="addons for openhab3 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("openhab3")

conflicts=("openhab3-snapshot-addons")

source=("openhab-addons-${pkgver}.kar::https://openhab.jfrog.io/artifactory/libs-release/org/openhab/distro/openhab-addons/${pkgver}/openhab-addons-${pkgver}.kar")

sha256sums=('543d3bfa6dce921fb9fcfb97105846da4aa2d5cacdad6be910a340c5c30007ac')

package() {
    mkdir -p "${pkgdir}/usr/share/${_pkgbase}/addons"
    cp "${srcdir}/openhab-addons-${pkgver}.kar" "${pkgdir}/usr/share/${_pkgbase}/addons"
    echo "z "/usr/share/${_pkgbase}/addons/openhab-addons-${pkgver}.kar" - ${_pkgbase} ${_pkgbase} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
