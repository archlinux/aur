# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=tv_grab_fr_telerama
pkgver=2.9
pkgrel=1
pkgdesc="Grab TV listings for France, XMLTV Grabber using telerama data"
arch=(any)
url="https://github.com/beavis69/${pkgname}"
license=("GPL")
depends=('xmltv' 'perl-digest-hmac')
makedepends=('git')
source=("https://github.com/beavis69/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "http://www.number6.ch/tools/logos.tar.gz")
md5sums=('ec2a774a60c56edc23b264310d071d82' '9a5c99e77a58358188b16301d7e0872b')

package() {
  mkdir -p ${pkgdir}/usr/bin/vendor_perl/
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  mkdir -p ${pkgdir}/usr/share/xmltv/${pkgname}/channel_icons/
  install -D -m 0755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} \
		     ${pkgdir}/usr/bin/vendor_perl/${pkgname}
# logos des chaînes :
  install -D -m 0644 ${srcdir}/logos/*.gif \
		     ${pkgdir}/usr/share/xmltv/${pkgname}/channel_icons/
# doc
  install -D -m 0644 ${srcdir}/${pkgname}-${pkgver}/README.md \
             ${pkgdir}/usr/share/doc/${pkgname}
}
