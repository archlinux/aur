# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Yodaz, MagicSeb
pkgname=scangearmp-mg3500series
pkgver=2.20
pkgrel=1
pkgdesc="Canon IJ Scanner Driver (MG3500 series)"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100470402.html"
license=('custom')
depends=('scangearmp-common-mg3500series')
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/0/0100005520/01/scangearmp-mg3500series-2.20-1-rpm.tar.gz")
md5sums=('78aca903bc0281be1e79a0bc276c7f15')

build() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*${CARCH}*.rpm)
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*i386*.rpm)
  fi
  cd $pkgdir
  rpmextract.sh $rpmfile
  mv usr/lib64 usr/lib
}
