# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=tv_grab_fr_telerama
pkgver=1.36
pkgrel=1
pkgdesc="Grab TV listings for France, from guidetv-iphone.telerama.fr"
arch=(any)
url="https://github.com/zubrick/${pkgname}"
license=("GPL")
depends=('xmltv' 'perl-digest-hmac')
source=("${pkgname}.git::git+https://github.com/zubrick/${pkgname}.git"
        "http://www.number6.ch/tools/logos.tar.gz")
md5sums=('SKIP' '9a5c99e77a58358188b16301d7e0872b')

package() {
  mkdir -p $pkgdir/usr/bin/vendor_perl/
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/xmltv/${pkgname}/channel_icons/
  install -D -m 0755 $srcdir/${pkgname}.git/${pkgname} \
		     $pkgdir/usr/bin/vendor_perl/${pkgname}
# logos des chaînes :
  install -D -m 0644 $srcdir/logos/*.gif \
		     $pkgdir/usr/share/xmltv/${pkgname}/channel_icons/
# doc
  install -D -m 0644 $srcdir/${pkgname}.git/README.md \
             $pkgdir/usr/share/doc/$pkgname
}
