pkgname=cnijfilter-mp520
pkgver=2.80
pkgrel=2
pkgdesc="Canon IJ Printer Driver for Pixma MP520 multifunctional"
url="http://www.canon.co.uk/For_Home/Product_Finder/Multifunctionals/Inkjet/PIXMA_MP520/index.asp"
arch=('x86_64' 'i686')
license=('custom:cnijfilter-common')
depends=('libxi' 'libcups' 'popt' 'lib32-libtiff3' 'lib32-libpng12')
makedepends=('rpmextract')
source=('http://files.canon-europe.com/files/soft28477/Software/28477.tgz')
md5sums=('e88e7dedfce1e2565a6437933e9e6a3c')

build() {
    cd ${srcdir}/
    tar -zxvf 28477.tgz
    rpmextract.sh cnijfilter-mp520series-2.80-1.i386.rpm       
}

package() {
    cd ${srcdir}/
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share
    mv usr/local/bin/* ${pkgdir}/usr/bin
    mv usr/local/share/* ${pkgdir}/usr/share
    rm -rf ${pkgdir}/usr/local
    mkdir -p ${pkgdir}/usr/share/licenses
    ln -s /usr/share/licenses/cnijfilter-common ${pkgdir}/usr/share/licenses/cnijfilter-mp520
    chmod -R a+rX usr/
}
