pkgname=scangearmp-mg5400series
pkgver=2.00
pkgrel=1
pkgdesc="Canon IJ Scanner Driver (MG5400 series)"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100470402.html"
license=('unknown')
depends=('scangearmp-common')
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/4/0100004704/01/scangearmp-mg5400series-2.00-1-rpm.tar.gz")
md5sums=('378d735249c08affd5284766e7e58d15')

package() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*${CARCH}*.rpm)
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*i386*.rpm)
  fi
  cd $pkgdir
  rpmextract.sh $rpmfile
  mv usr/lib64 usr/lib
}

