# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>

options=(debug !strip)
pkgname=otf-kokoro
pkgver=1
pkgrel=4
pkgdesc="Japanese slender font (Mincho-style) based on IPA Font v3"
arch=('any')
url="http://typingart.net/"
license=('custom:IPA Font License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=otf.install
source=("http://typingart.net/fontdata/kokoro.zip")
md5sums=('a4aec0cda52c8291dd692e1ebc0deae2')

DLAGENTS=("http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --referer ${url}")

package() {
  cd ${srcdir}/

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt \
                read_me.txt \
                "${pkgdir}/usr/share/licenses/${pkgname}/"
}
