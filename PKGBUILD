# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=sequencematrix
_pkgname=SequenceMatrix
pkgver=1.9
pkgrel=6
depends=(
	'java-runtime'
)
pkgdesc="Taxonomy-aware DNA sequence processing toolkit"
arch=('x86_64')
url="https://github.com/gaurav/taxondna"
license=('GPL2')
source=("https://github.com/gaurav/taxondna/releases/download/v${pkgver}/SequenceMatrix-${pkgver}.zip" "$pkgname.desktop")
sha256sums=('ba46fe8672ded973c835ea0a636c251d28fa2f80ee30a69469a4a7fab204e814'
            'a0ab58fb1c9611627344cf20e1441b913fae37287d375ace9837763fabd1dd65')

package() {
    install -dm755 "$pkgdir"/usr/share/{$pkgname,applications}
    chmod +x ${srcdir}/SequenceMatrix-${pkgver}/SequenceMatrix.jar
    install -Dm755 ${srcdir}/$pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
    install -Dm755 ${srcdir}/SequenceMatrix-${pkgver}/SequenceMatrix.jar ${pkgdir}/usr/share/$pkgname/$pkgname.jar
    mv ${srcdir}/SequenceMatrix-${pkgver}/* ${pkgdir}/usr/share/$pkgname/
}
