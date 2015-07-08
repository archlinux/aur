pkgname=cnijfilter-mg5400series
pkgver=3.80
pkgrel=1
pkgdesc="Canon MG5450 printer driver"
arch=('i686', 'x86_64')
url="http://support-sg.canon-asia.com/contents/SG/EN/0100467102.html"
license=('unknown')
depends=('atk' 'glibc' 'glib2' 'cairo' 'cups' 'fontconfig' 'gtk2' 'pango' 'libpng12' 'popt' 'libtiff3' 'libx11' 'libxcursor' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxml2' 'libxrandr' 'libxrender' 'cnijfilter-common-mg5400>=3.80')
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/1/0100004671/01/cnijfilter-mg5400series-3.80-1-rpm.tar.gz")
md5sums=('e76ff321213bca10ae33aef9f162c301')

package() {
 if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*${CARCH}*.rpm)
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*i386*.rpm)
  fi  
  cd $pkgdir
  rpmextract.sh $rpmfile
}

