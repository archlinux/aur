# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Ripper93 <ripper93@cock.li>

pkgname=cnijfilter-mg2400series
pkgver=4.00
pkgrel=2
_pkgrel=1
pkgdesc="Canon IJ Printer Driver For MG-2400"
arch=('i686' 'x86_64')
url="http://support-ph.canon-asia.com/contents/PH/EN/0100466201.html"
license=('unknown')
depends=('cups' 'popt' 'libxml2' 'gtk2' 'libtiff' 'libpng' 'cnijfilter-common-mg2400')
source=("http://gdlp01.c-wss.com/gds/9/0100005499/01/cnijfilter-mg2400series-$pkgver-$_pkgrel-rpm.tar.gz")
md5sums=('73b00b2ca8d327ce9b427b5438d34d1c')

package() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name cnijfilter-mg2400series-$pkgver*${CARCH}*.rpm)
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name cnijfilter-mg2400series-$pkgver*i386*.rpm)
  fi
  cd $pkgdir
  bsdtar -xf $rpmfile
  [[ "${CARCH}" = 'x86_64' ]] && mv $pkgdir/usr/lib64 $pkgdir/usr/lib
}
