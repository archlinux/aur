# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=cnijfilter-mg2500series
pkgver=4.00
pkgrel=2
pkgdesc="Canon IJ Printer Driver (for mg2500 series)"
arch=('i686' 'x86_64')
url="http://support-ph.canon-asia.com/contents/PH/EN/0100550101.html"
license=('unknown')
depends=('cups' 'popt' 'libxml2' 'gtk2' 'libtiff' 'libpng' 'cnijfilter-common-mg2500')
source=('http://gdlp01.c-wss.com/gds/1/0100005501/01/cnijfilter-mg2500series-4.00-1-rpm.tar.gz')
md5sums=('37fd638ae176fad74fd656f6cb719ead')

package() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name "cnijfilter-mg2500series-$pkgver*${CARCH}*.rpm")
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name "cnijfilter-mg2500series-$pkgver*i386*.rpm")
  fi
  cd $pkgdir
  bsdtar -xf $rpmfile
  [[ "${CARCH}" = 'x86_64' ]] && mv $pkgdir/usr/lib64 $pkgdir/usr/lib
}
