# Maintainer: luxcem <a@luxcem.fr>
# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>

pkgname=otf-kodomo-maru-gothic
pkgver=1
pkgrel=2
pkgdesc="Japanese rounded gothic font (Handwritten style)"
url="https://typingart.net/?p=40"
arch=("any")
license=("custom")
source=("typingart_license.txt"
        "https://typingart.net/fontdata/kodomo.zip")
sha256sums=("0db73a694e302a3dd5caa4d98b479e1350a3e6be41cea7d05a5217c3a14867ed"
            "1b10d1f00ec7876b0f13b91e8366b6193908c7aa531ac6b29d860c968314ac3b")
# Official source is typingart.net but does not support download without
# the official Referer header.
DLAGENTS=("https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --referer ${url}")

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 typingart_license.txt "${pkgdir}/usr/share/licenses/${pkgname}/"LICENCE
}


