pkgname=mathematica-documentation-zh-cn
pkgver=13.2.0
pkgrel=1
pkgdesc="Mathematica Documentation (zh-cn)"
url="http://www.wolfram.com/mathematica/"
license=("proprietary")
arch=('any')
depends=('mathematica')
source=("local://WLDocs_${pkgver}_Chinese_LINUX_CN.sh")
md5sums=('2fcc524c73bfdf93b34befe754c3fb35')
install=install.install

package() {
    sh ${srcdir}/WLDocs_${pkgver}_Chinese_LINUX_CN.sh -- \
            -execdir=${pkgdir}/usr/bin \
            -targetdir=${pkgdir}/opt/Mathematica_doc \
            -auto

    mkdir -p ${pkgdir}/opt/Mathematica
    mv ${pkgdir}/opt/Mathematica_doc/Documentation ${pkgdir}/opt/Mathematica/
    rm -rf ${pkgdir}/opt/Mathematica_doc
}
