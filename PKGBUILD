# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Benjamin Chretien <chretien@lirmm.fr>

pkgname=cnijfilter-mg5300series
pkgver=3.60
pkgrel=3
pkgdesc="Canon IJ Printer Driver for Pixma MG5300 Series"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100395502.html"
license=('custom')
source=("http://gdlp01.c-wss.com/gds/5/0100003955/01/cnijfilter-mg5300series-${pkgver}-1-rpm.tar.gz")
md5sums=('a2546dc172f82113dfdcd469fa2f574b')

package() {
    cd $pkgdir
    bsdtar -xf $srcdir/$pkgname-$pkgver-1-rpm/packages/$pkgname-$pkgver-1.$CARCH.rpm
    bsdtar -xf $srcdir/$pkgname-$pkgver-1-rpm/packages/cnijfilter-common-$pkgver-1.$CARCH.rpm
    rm -R usr/lib/cups
    if [ "${CARCH}" = 'x86_64' ]; then
      mv usr/lib64/* usr/lib
      rm -R usr/lib64
    fi
}
