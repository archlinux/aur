# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_pkgbase=openhab3
pkgname=${_pkgbase}-snapshot-addons
pkgver=3.4.0
pkgrel=1
pkgdesc="addons for openhab3 open source home automation software"
arch=("any")
url="http://www.openhab.org/"
license=("EPL")
depends=("openhab3-snapshot")

conflicts=("openhab3-addons")

source=("openhab-addons-${pkgver}-SNAPSHOT.kar::https://ci.openhab.org/job/openHAB3-Distribution/lastSuccessfulBuild/artifact/distributions/openhab-addons/target/openhab-addons-${pkgver}-SNAPSHOT.kar")

sha256sums=('SKIP')

package() {
    mkdir -p "${pkgdir}/usr/share/${_pkgbase}/addons"
    cp "${srcdir}/openhab-addons-${pkgver}-SNAPSHOT.kar" "${pkgdir}/usr/share/${_pkgbase}/addons"
    echo "z "/usr/share/${_pkgbase}/addons/openhab-addons-${pkgver}-SNAPSHOT.kar" - ${_pkgbase} ${_pkgbase} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
