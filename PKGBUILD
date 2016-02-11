# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=tv_grab_fr_telerama
pkgver=1.20
pkgrel=2
pkgdesc="Grab TV listings for France, from guidetv-iphone.telerama.fr"
arch=(any)
url="https://github.com/ybonnel/ybo-tv-xmltv/blob/master/${pkgname}"
license=("GPL")
depends=('xmltv')
source=("https://raw.githubusercontent.com/ybonnel/ybo-tv-xmltv/master/${pkgname}"
        "http://www.number6.ch/tools/logos.tar.gz")
md5sums=('02fd2a61c373e540e446d0c9b683afea' '9a5c99e77a58358188b16301d7e0872b')

package() {
  mkdir -p $pkgdir/usr/bin/vendor_perl/
  mkdir -p $pkgdir/usr/share/xmltv/${pkgname}/channel_icons/
  install -D -m 0755 $srcdir/${pkgname} \
		     $pkgdir/usr/bin/vendor_perl/${pkgname}
# logos des chaînes :
  install -D -m 0644 $srcdir/logos/*.gif \
		     $pkgdir/usr/share/xmltv/${pkgname}/channel_icons/		     
}
