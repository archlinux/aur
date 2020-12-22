# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_pkgbase=openhab3
pkgname=${_pkgbase}-addons
pkgver=3.0.0
pkgrel=1
pkgdesc="addons for openhab3 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("openhab3")

conflicts=("openhab3-snapshot-addons")

source=("openhab-addons-${pkgver}.kar::https://bintray.com/openhab/mvn/download_file?file_path=org/openhab/distro/openhab-addons/${pkgver}/openhab-addons-${pkgver}.kar")

sha256sums=('228994708b20bc0cd60cef5be68d72f2c4617f9c7199a375c16c3a9ab92f6b2c')

package() {
    mkdir -p "${pkgdir}/usr/share/${_pkgbase}/addons"
    cp "${srcdir}/openhab-addons-${pkgver}.kar" "${pkgdir}/usr/share/${_pkgbase}/addons"
    echo "z "/usr/share/${_pkgbase}/addons/openhab-addons-${pkgver}.kar" - ${_pkgbase} ${_pkgbase} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
