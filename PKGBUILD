# Maintainer: Ben Alex <ben.alex@acegi.com.au>
_pkgbase=openhab5
pkgname=${_pkgbase}-addons
pkgver=5.1.1
pkgrel=1
pkgdesc="addons for openhab5 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("openhab5")

conflicts=("openhab5-snapshot-addons")

source=("openhab-addons-${pkgver}.kar::https://openhab.jfrog.io/artifactory/libs-release/org/openhab/distro/openhab-addons/${pkgver}/openhab-addons-${pkgver}.kar")
sha256sums=('1c5004f06a65b3d558b6f54235b8f8b5779484ffd1415672041cd653dcd5c3b3')

package() {
    mkdir -p "${pkgdir}/usr/share/${_pkgbase}/addons"
    cp "${srcdir}/openhab-addons-${pkgver}.kar" "${pkgdir}/usr/share/${_pkgbase}/addons"
    echo "z "/usr/share/${_pkgbase}/addons/openhab-addons-${pkgver}.kar" - ${_pkgbase} ${_pkgbase} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
