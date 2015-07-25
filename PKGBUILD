#Maintainer: aus4000 - 9aus4000@gmail.com
pkgname=('cnijfilter-mg5500series')
pkgver=4.00
pkgrel=1
pkgdesc="Canon MG5500 series printer driver"
arch=('i686' 'x86_64')
url="http://support-sg.canon-asia.com/contents/SG/EN/0100467102.html"
license=('custom')
depends=('atk' 'glibc' 'glib2' 'cairo' 'cups' 'fontconfig' 'gtk2' 'pango' 'libpng' 'popt' 'libtiff' 'libx11' 
'libxcursor' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxml2' 'libxrandr' 'libxrender' 'cnijfilter-common' )
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/5/0100005505/01/cnijfilter-mg5500series-4.00-1-rpm.tar.gz")
md5sums=('4abe4396e4efc7ff90f459ccf493bb9c')

package_cnijfilter-mg5500series() {
if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*${CARCH}*.rpm)
elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*i386*.rpm)
fi 
cd $pkgdir
rpmextract.sh $rpmfile
mv usr/lib64 usr/lib
}
