# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=spread
pkgver=1.0.7
_pkgver=1-0-7
pkgrel=1
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
pkgdesc="a user-friendly application to analyze and visualize phylogeographic reconstructions resulting from Bayesian inference of spatio-temporal diffusion"
arch=('x86_64')
url="https://rega.kuleuven.be/cev/ecv/software/${pkgname}"
license=('custom')
source=("https://rega.kuleuven.be/cev/ecv/software/${pkgname}_files/${pkgname}-v${_pkgver}.jar" "${pkgname}.desktop")
sha256sums=('2807406ba184d78d4d62adf2aa868f3b22b80719eb740085b13067183c907e71'
            'a66b1681504a55e18926dd69cdcb8db13e6b76a9860b04c98cf2a881fd19aa09')

package() {
    install -dm755 "$pkgdir"/usr/share/{applications,${pkgname}}
    install -m 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
    install -m 755 ${srcdir}/icons/${pkgname}.png ${pkgdir}/usr/share/${pkgname}
    install -m 755 ${srcdir}/${pkgname}-v${_pkgver}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
}
