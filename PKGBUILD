pkgname=mathematica-documentation-zh-cn
pkgver=14.0.0
pkgrel=1
pkgdesc="Mathematica Documentation (zh-cn)"
url="http://www.wolfram.com/mathematica/"
license=("proprietary")
arch=('any')
depends=('mathematica-light')
source=("local://WLDocs_${pkgver}_Chinese_LINUX.sh")
md5sums=('03c2ccf2009d4877e13f77e021e47b20')

package() {
    sh ${srcdir}/WLDocs_${pkgver}_Chinese_LINUX.sh -- \
            -execdir=${pkgdir}/usr/bin \
            -targetdir=${pkgdir}/opt/Mathematica_doc \
            -auto

    mkdir -p ${pkgdir}/opt/Mathematica
    mv ${pkgdir}/opt/Mathematica_doc/Documentation ${pkgdir}/opt/Mathematica/
    rm -rf ${pkgdir}/opt/Mathematica_doc
}
