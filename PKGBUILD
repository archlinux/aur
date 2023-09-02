pkgname=mathematica-documentation-en
pkgver=13.3
pkgrel=1
pkgdesc="Mathematica Documentation (en)"
url="http://www.wolfram.com/mathematica/"
license=("proprietary")
arch=('any')
depends=('mathematica-light')
source=("local://WLDocs_${pkgver}_LINUX.sh")
md5sums=('f3aa5219b0b097117aec0a0cdb335944')

package() {
    sh ${srcdir}/WLDocs_${pkgver}_LINUX.sh -- \
            -execdir=${pkgdir}/usr/bin \
            -targetdir=${pkgdir}/opt/Mathematica_doc \
            -auto

    mkdir -p ${pkgdir}/opt/Mathematica
    mv ${pkgdir}/opt/Mathematica_doc/Documentation ${pkgdir}/opt/Mathematica/
    rm -rf ${pkgdir}/opt/Mathematica_doc
}
