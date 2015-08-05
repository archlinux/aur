# Maintainer: Sauliusl <luksaulius[at]gmail[dot]com>
pkgname=fseq
pkgver=1.84
pkgrel=1
pkgdesc="software package that generates a continuous tag sequence density estimation allowing identification of biologically meaningful sites whose output can be displayed directly in the UCSC Genome Browser"
url="http://fureylab.web.unc.edu/software/fseq/"
arch=('any')
license=('GPL3')
depends=('java-environment')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("http://fureylab.med.unc.edu/fseq/${pkgname}_${pkgver}.tgz"
        "fseq.sh")
sha1sums=('47921ef9cce35de1304baaa529b90a41834b29fb'
          '21784aa264ed296efd630644383e2579b44af451')

build() {
	cd ${srcdir}/fseq/
}

package() {
	cd ${srcdir}/fseq/

	install -d ${pkgdir}/usr/share/java/${pkgname}
	install -Dm0644 lib/*.jar ${pkgdir}/usr/share/java/${pkgname}/
	
	install -d ${pkgdir}/usr/bin/ 

	# Move our .sh script, not theirs to usr/bin
	install -Dm0755 ${srcdir}/fseq.sh ${pkgdir}/usr/bin/fseq
}

# vim:set ts=2 sw=2 et:
