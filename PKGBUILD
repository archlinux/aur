# Maintainer: allencch <allencch at hotmail dot com>
pkgname=motifsampler
pkgver=3.2
pkgrel=1
pkgdesc="The Gibbs Motif Sampler for identifying motifs, conserved regions, in DNA or protein sequences"
arch=('i686' 'x86_64')
url="https://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download.html"
license=('GPL')

source_i686=("Linux-32.${pkgver}.tar.gz::https://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download/linux_3.2/MotifSampler")

source_x86_64=("Linux-64.${pkgver}.tar.gz::https://homes.esat.kuleuven.be/~sistawww/bioi/thijs/download/linux_x86-64/MotifSampler")
md5sums_i686=('c2867739e66744c43d6d0005f6d1d6c7')
md5sums_x86_64=('8555341389cee01efde2a3b2c2d475c7')

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
