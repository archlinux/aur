pkgname=cnijfilter-mg6300
_pkgname=cnijfilter-common
pkgver=3.80
pkgrel=10
pkgdesc="Canon MG6300 printer driver"
arch=('i686' 'x86_64')
url="http://support-sg.canon-asia.com/contents/SG/EN/0100468802.html"
license=('unknown')
depends=('atk' 'glibc' 'glib2' 'cairo' 'cups' 'fontconfig' 'gtk2' 'pango' 'libpng12' 'popt' 'libtiff3' 'libx11' 'libxcursor' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxml2' 'libxrandr' 'libxrender' 'cnijfilter-common-mg5400')
makedepends=('rpmextract')
options=('emptydirs')
source=("http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNDY4ODAx&cmp=ACB")
md5sums=('531641498aa929e628c47e918d809571')

package() {
 if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name $_pkgname-$pkgver*${CARCH}*.rpm)
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name $_pkgname-$pkgver*i386*.rpm)
  fi  
  cd $pkgdir
  rpmextract.sh $rpmfile
}

