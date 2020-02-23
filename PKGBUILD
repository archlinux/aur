# Maintainer: luxcem <a@luxcem.fr>
# Contributor: kusanaginoturugi <kusanaginoturugi at gmail dot com>

pkgname=otf-kokoro
pkgver=1
pkgrel=4
pkgdesc="Japanese slender font (Mincho-style) based on IPA Font v3"
url="https://typingart.net/?p=46"
license=("custom:IPA Font License")
arch=("any")
depends=("fontconfig")
source=("https://typingart.net/fontdata/kokoro.zip")
sha256sums=("e4566175799d52f9e3b6dd8774596428ea27dd40596e1283aa627689e5ac98d8")
# Official source is typingart.net but does not support download without
# the official Referer header.
DLAGENTS=("https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --referer ${url}")

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 IPA_Font_License_Agreement_v1.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/"LICENCE
}
