# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>

pkgname=otf-kodomo-maru-gothic-narrow
pkgver=1
pkgrel=1
pkgdesc="Japanese light rounded gothic font (Handwritten style)"
arch=('any')
url="http://typingart.net/?p=51"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=otf-kodomo-maru-gothic-narrow.install
source=("http://typingart.net/fontdata/kodomo_light.zip")
md5sums=('ad6abc2527a6dc91103b6654562c534b')

DLAGENTS=("http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --referer ${url}")

package() {
  cd ${srcdir}/
  cp ../typingart_license.txt .

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 typingart_license.txt \
                "${pkgdir}/usr/share/licenses/${pkgname}/"
}
