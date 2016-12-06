# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>

pkgname=otf-kodomo-maru-gothic
pkgver=1
pkgrel=1
pkgdesc="Japanese rounded gothic font (Handwritten style)"
arch=('any')
url="http://typingart.net/?p=40"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=otf-kodomo-maru-gothic.install
source=("http://typingart.net/fontdata/kodomo.zip")
md5sums=('3a1110ea1732efaa7cf440f0ece44269')

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
