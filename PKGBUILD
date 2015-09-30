#Maintainer: aus4000 - 9aus4000@gmail.com
pkgname=('cnijfilter-mg5500series')
pkgver=4.00
pkgrel=1
pkgdesc="Canon MG5500 series printer driver"
arch=('i686' 'x86_64')
url="http://support-sg.canon-asia.com/contents/SG/EN/0100550502.html"
license=('custom')
depends=('atk' 'glibc' 'glib2' 'cairo' 'cups' 'fontconfig' 'gtk2' 'pango' 'libpng' 'popt' 'libtiff' 'libx11' 
'libxcursor' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxml2' 'libxrandr' 'libxrender' 'cnijfilter-common' )
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/5/0100005505/01/cnijfilter-mg5500series-4.00-1-rpm.tar.gz")
sha256sums=('9b06ca574a4ea86781b00d1612278af5ab9e0dea6a8aa4b38cf47d3b07426dba')

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
