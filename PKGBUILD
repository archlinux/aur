# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=seqencematrix
_installname=SeqenceMatrix
pkgver=1.8.2
pkgrel=1
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
pkgdesc="Taxonomy-aware DNA sequence processing toolkit"
arch=('x86_64')
url="https://github.com/gaurav/taxondna"
license=('GPL2')
source=("https://github.com/gaurav/taxondna/releases/download/v${pkgver}/SequenceMatrix.jar")
sha256sums=('SKIP')

package() {
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/bin"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"
    install -Dm644 ${srcdir}/SequenceMatrix.jar ${pkgdir}/usr/share/seqencematrix/SeqenceMatrix.jar
    ln -s "/usr/share/seqencematrix/SeqenceMatrix.jar" "${pkgdir}/usr/bin"
    install -Dm644 ~/.cache/yay/seqencematrix/seqencematrix.desktop "${pkgdir}/usr/share/applications/seqencematrix.desktop"
}
