# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=phylonet-hmm
_installname=PhyloNet
pkgver=0.1
pkgrel=1
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
pkgdesc="An HMM-based comparative genomic framework for detecting introgression in eukaryotes"
arch=('x86_64')
url="https://bioinfocs.rice.edu/node/108"
license=('Apache (Software) License 2')
source=("https://bioinfocs.rice.edu/sites/g/files/bxs266/f/phmm-0.1.tar_0.bz2" "https://bioinfocs.rice.edu/sites/g/files/bxs266/f/phmm_0.jar" "https://bioinfocs.rice.edu/sites/g/files/bxs266/f/simulated-datasets.tar.bz2" "https://bioinfocs.rice.edu/sites/g/files/bxs266/f/empirical-datasets.tar.bz2")
sha256sums=('a05afde10e6cef5d3b2901c2258dbc11d93f02b2869c8373e678f0d0fdecd8f2'
            '3acd37b03c535864be0e8255c7035bf2620fa02141851aae61bb7e3552c6f3ed'
            '92812ad3ea26cb868addd4c2ac64c07037686df7f4e2d205d6144eeb4647cf68'
            '9cfc7db089d2a645375baf556084cfed74bf8e0f338a006e32651a6caa8d7ee9')

package() {
    install -dm755 "$pkgdir"/usr/share/phylonet-hmm/{phmm-${pkgver},empirical-datasets,simulated-datasets}
    install -Dm644 ${srcdir}/phmm_0.jar ${pkgdir}/usr/share/phylonet-hmm/phmm.jar
    mv ${srcdir}/phmm-${pkgver}/* ${pkgdir}/usr/share/phylonet-hmm/phmm-${pkgver}
    mv ${srcdir}/data-MWN1287-DGA-C5-SEG1-RN5.REFERENCE.WGS ${pkgdir}/usr/share/phylonet-hmm/empirical-datasets
    mv ${srcdir}/data-Yu2097m-Yu2120f-C5-SEG1-RN5.REFERENCE.WGS ${pkgdir}/usr/share/phylonet-hmm/empirical-datasets
    mv ${srcdir}/MS-INTROGRESSION-SIMULATION ${pkgdir}/usr/share/phylonet-hmm/simulated-datasets
}

