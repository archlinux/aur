# Maintainer: Ben Alex <ben.alex@acegi.com.au>
_pkgbase=openhab4
pkgname=${_pkgbase}-addons
pkgver=4.0.2
pkgrel=1
pkgdesc="addons for openhab4 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("openhab4")

conflicts=("openhab4-snapshot-addons")

source=("openhab-addons-${pkgver}.kar::https://openhab.jfrog.io/artifactory/libs-release/org/openhab/distro/openhab-addons/${pkgver}/openhab-addons-${pkgver}.kar")
sha256sums=('de1fbbb2944176712852161b1311e69f3663f46854d216abab7f3b2c49638cfa')


package() {
    mkdir -p "${pkgdir}/usr/share/${_pkgbase}/addons"
    cp "${srcdir}/openhab-addons-${pkgver}.kar" "${pkgdir}/usr/share/${_pkgbase}/addons"
    echo "z "/usr/share/${_pkgbase}/addons/openhab-addons-${pkgver}.kar" - ${_pkgbase} ${_pkgbase} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
