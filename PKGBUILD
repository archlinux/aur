# Maintainer: Igor Muzyka <muzyka-iv@mail.ru>

pkgname=brother-dcp1510
pkgver=3.0.1_1
pkgrel=2
pkgdesc="Brother cups and lpr driver for DCP-1510, DCP-1510r, DCP-1511, DCP-1512, DCP-1512r, DCP-1518"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/s/id/linux/en/download_prn.html"
license=('GPL')
depends=('psutils' 'cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4: scanner support')

source=(http://www.brother.com/pub/bsc/linux/dlf/dcp1510lpr-3.0.1-1.i386.deb
		http://www.brother.com/pub/bsc/linux/dlf/dcp1510cupswrapper-3.0.1-1.i386.deb)

md5sums=('20aad8606e54516346348702ff137701'
		 '15a01c13ef18510b5b40576505cd016e')

install=install

package() {
cd $srcdir
mkdir dcp1510lpr
mkdir dcp1510cupswrapper
cd dcp1510lpr
ar x ../dcp1510lpr-3.0.1-1.i386.deb
cd ../dcp1510cupswrapper
ar x ../dcp1510cupswrapper-3.0.1-1.i386.deb
cd $pkgdir
tar xvfp $srcdir/dcp1510lpr/data.tar.gz
tar xvfp $srcdir/dcp1510cupswrapper/data.tar.gz
sed -i '/chown/d' ./opt/brother/Printers/DCP1510/inf/setupPrintcap
}
