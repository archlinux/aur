# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Benjamin Chretien <chretien@lirmm.fr>
pkgname=cnijfilter-mg5300series
pkgver=3.60
pkgrel=2
pkgdesc="Canon IJ Printer Driver for Pixma MG5300 Series"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100395502.html"
license=('custom')
makedepends=('rpmextract')
source=("http://gdlp01.c-wss.com/gds/5/0100003955/01/cnijfilter-mg5300series-${pkgver}-1-rpm.tar.gz")
md5sums=('a2546dc172f82113dfdcd469fa2f574b')

package() {
    cd ${srcdir}
    tar -zxvf cnijfilter-mg5300series-${pkgver}-1-rpm.tar.gz
    cd ${pkgdir}
    rpmextract.sh ${srcdir}/cnijfilter-mg5300series-${pkgver}-1-rpm/packages/cnijfilter-mg5300series-${pkgver}-1.${arch}.rpm
    rpmextract.sh ${srcdir}/cnijfilter-mg5300series-${pkgver}-1-rpm/packages/cnijfilter-common-${pkgver}-1.${arch}.rpm
    rm -R ${pkgdir}/usr/lib/cups
    mv ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib
    rm -R ${pkgdir}/usr/lib64
}
