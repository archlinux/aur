# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_pkgbase=openhab3
pkgname=${_pkgbase}-addons
pkgver=3.0.0.RC1
pkgrel=1
pkgdesc="addons for openhab3 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("openhab3")

conflicts=("openhab3-snapshot-addons")

source=("openhab-addons-${pkgver}.kar::https://openhab.jfrog.io/openhab/libs-milestone-local/org/openhab/distro/openhab-addons/${pkgver}/openhab-addons-${pkgver}.kar")

sha256sums=('829738aa66d57be38f914eceffa39d113ae1f11f9f28e4ecd2001602ea61c32d')

package() {
    mkdir -p "${pkgdir}/usr/share/${_pkgbase}/addons"
    cp "${srcdir}/openhab-addons-${pkgver}.kar" "${pkgdir}/usr/share/${_pkgbase}/addons"
    echo "z "/usr/share/${_pkgbase}/addons/openhab-addons-${pkgver}.kar" - ${_pkgbase} ${_pkgbase} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
