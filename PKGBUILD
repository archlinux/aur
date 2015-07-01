# Maintainer: Thiago Almeida <thiagoalmeidasa at gmail dot com>

pkgname=iscan-plugin-esdip
pkgver=1.0.0
pkgrel=5
pkgdesc="This package adds some image processing options to the 'epkowa' backend. Included are: - skew correction - autocropping"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('avasys')
depends=('iscan' 'iscan-data')
makedepends=('deb2targz')
source=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/57/72/573f35de6884fbd0f405a1e9ffc8eb9a9b126160/iscan-plugin-esdip_${pkgver}-5.ltdl7_i386.deb)
[[ $CARCH == "x86_64" ]] && \
source=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/57/72/29c5c9847ee193820567ca5e75a5a2618a1c69eb/iscan-plugin-esdip_${pkgver}-5.ltdl7_amd64.deb)
md5sums=('e3553d8c6fb6bea35c2baef251193e22')
[[ $CARCH == "x86_64" ]] && md5sums=('897370ae92925fe626c0517dc2831164')
package() {
  cd $srcdir
  deb2targz $(basename ${source[0]})
  tar -xf $(basename ${source[0]//.deb/.tar.gz})
  mv usr ${pkgdir}/
  mkdir $pkgdir/usr/share/licences
  mv ${pkgdir}/usr/share/doc/* $pkgdir/usr/share/licences/
  rmdir $pkgdir/usr/share/doc
}
