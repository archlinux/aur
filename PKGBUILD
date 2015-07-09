pkgname=cnijfilter-common-mg5400
pkgver=3.80
pkgrel=1
pkgdesc="Canon IJ Printer Driver (Common package)"
arch=('i686' 'x86_64')
url="http://support-sg.canon-asia.com/contents/SG/EN/0100467102.html"
license=('unknown')
depends=('libcups' 'popt')
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/1/0100004671/01/cnijfilter-mg5400series-3.80-1-rpm.tar.gz")
md5sums=('e76ff321213bca10ae33aef9f162c301')

package() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name cnijfilter-common-$pkgver*${CARCH}*.rpm)
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name cnijfilter-common-$pkgver*i386*.rpm)
  fi
  cd $pkgdir
  rpmextract.sh $rpmfile
}

