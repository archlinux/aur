# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=spread3
pkgver=0.9.6
_pkgver=0-9-6
pkgrel=1
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
pkgdesc="a user-friendly application to analyze and visualize pathogen phylodynamic reconstructions resulting from Bayesian inference of sequence and trait evolutionary processes"
arch=('x86_64')
url="https://rega.kuleuven.be/cev/ecv/software/SpreaD3"
license=('custom')
source=("https://rega.kuleuven.be/cev/ecv/software/${pkgname}_files/${pkgname}-v${_pkgver}.jar" "${pkgname}.desktop")
sha256sums=('4021b6dea480bec88c17666088c47f3ec1135c8f6ea7d9bb6cc21639ffc7956f'
            'd3083d2471aca7cfb8e8a7da13f998bbbd94ce73c52a190fdfe0681500732191')

package() {
    install -dm755 "$pkgdir"/usr/share/{applications,${pkgname}}
    install -m 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
    install -m 755 ${srcdir}/gui/icons/spread.png ${pkgdir}/usr/share/${pkgname}
    install -m 755 ${srcdir}/${pkgname}-v${_pkgver}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
}
