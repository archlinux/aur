# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_pkgbase=openhab3
pkgname=${_pkgbase}-addons
pkgver=3.0.0.RC2
pkgrel=1
pkgdesc="addons for openhab3 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("openhab3")

conflicts=("openhab3-snapshot-addons")

source=("openhab-addons-${pkgver}.kar::https://openhab.jfrog.io/openhab/libs-milestone-local/org/openhab/distro/openhab-addons/${pkgver}/openhab-addons-${pkgver}.kar")

sha256sums=('a9be21fe39c20c85c563842f0a542d022b5c4bde04d0402b2a7564c81a8f9f74')

package() {
    mkdir -p "${pkgdir}/usr/share/${_pkgbase}/addons"
    cp "${srcdir}/openhab-addons-${pkgver}.kar" "${pkgdir}/usr/share/${_pkgbase}/addons"
    echo "z "/usr/share/${_pkgbase}/addons/openhab-addons-${pkgver}.kar" - ${_pkgbase} ${_pkgbase} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
