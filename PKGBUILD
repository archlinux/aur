# Maintainer: allencch <allencch at hotmail dot com>
pkgname=motifsampler
pkgver=3.1
pkgrel=3
pkgdesc="The Gibbs Motif Sampler for identifying motifs, conserved regions, in DNA or protein sequences"
arch=('i686' 'x86_64')
url="http://ccmbweb.ccv.brown.edu/gibbs/gibbs.html"
license=('GPL')

source_i686=("Linux-32.${pkgver}.tar.gz::http://ccmbweb.ccv.brown.edu/cgi-bin/download_3_1_3.pl?download_file=Linux-32-${pkgver}.tar.gz&name=researcher&institution=research&address=research@research.com")

source_x86_64=("Linux-64.${pkgver}.tar.gz::http://ccmbweb.ccv.brown.edu/cgi-bin/download_3_1_3.pl?download_file=Linux-64-${pkgver}.tar.gz&name=researcher&institution=research&address=research@research.com")
md5sums_i686=('4cb5376a7fc40049d0506b2b9463fb9b')
md5sums_x86_64=('d64e9e62ef6d1b8442abccdd94ef6a73')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/MotifSampler"

    if [ $CARCH == "i686" ] ; then
        _arch="32"
        unifiedcpp=unifiedcpp.linux
    else
        _arch="64"
        unifiedcpp=unifiedcpp.opteron
    fi

    install -m755 Gibbs.x86_${_arch} seq.weights.pl $unifiedcpp wilcox.test "${pkgdir}/usr/bin"
    cp ChangeLog crp.fa readme.unified README "${pkgdir}/opt/MotifSampler"
}
