pkgname=mathematica-documentation-zh-cn
pkgver=13.3
pkgrel=1
pkgdesc="Mathematica Documentation (zh-cn)"
url="http://www.wolfram.com/mathematica/"
license=("proprietary")
arch=('any')
depends=('mathematica-light')
source=("local://WLDocs_${pkgver}_Chinese_LINUX.sh")
md5sums=('a42fc9fdb6d43986ea46c73c487441d3')

package() {
    sh ${srcdir}/WLDocs_${pkgver}_Chinese_LINUX.sh -- \
            -execdir=${pkgdir}/usr/bin \
            -targetdir=${pkgdir}/opt/Mathematica_doc \
            -auto

    mkdir -p ${pkgdir}/opt/Mathematica
    mv ${pkgdir}/opt/Mathematica_doc/Documentation ${pkgdir}/opt/Mathematica/
    rm -rf ${pkgdir}/opt/Mathematica_doc
}
