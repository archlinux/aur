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
sha256sums=('0e018fa3a737044cde9877946aa8616baeb879429bd05675b743f28927a555c0')

package() {
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/bin"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"
    install -Dm644 ${srcdir}/SequenceMatrix.jar ${pkgdir}/usr/share/seqencematrix/SeqenceMatrix.jar
    ln -s "/usr/share/seqencematrix/SeqenceMatrix.jar" "${pkgdir}/usr/bin"
    install -Dm644 ~/.cache/yay/seqencematrix/seqencematrix.desktop "${pkgdir}/usr/share/applications/seqencematrix.desktop"
}
