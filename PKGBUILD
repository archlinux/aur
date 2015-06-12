# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=nmon2rrd
pkgver=17a
pkgrel=1
pkgdesc="Filter to convert nmon output files to rrdtool format"
arch=('i686' 'x86_64')
url="http://www-941.haw.ibm.com/collaboration/wiki/display/WikiPtype/nmon"
license=("custom")
depends=('glibc')
source=("https://www.ibm.com/developerworks/community/wikis/form/anonymous/api/wiki/61ad9cf2-c6a3-4d2c-b779-61ff0266d32a/page/190cda06-6ee0-48c7-9cb1-eeb0d14897ad/attachment/135bb742-4bcb-40d3-beb5-aba44d769f23/media/${pkgname}v${pkgver}.tar")
md5sums=('e68339f813628887aa859b71b4171a18')

build() {
cd $srcdir
sed -i "s/#include <strings.h>/#include <string.h>/" nmon2rrd_17.c
gcc -onmon2rrd nmon2rrd_17.c
}

package() {
install -D -m755 $srcdir/nmon2rrd $pkgdir/usr/bin/nmon2rrd
}
