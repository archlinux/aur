# Maintainer: luxcem <a@luxcem.fr>
# Contributor: yuhr <sdn.pate(at)gmail.com>

pkgname=otf-hannari-mincho
pkgver=1.12
pkgrel=2
pkgdesc="Japanese curvy and gentle style font (Mincho-style) based on IPA Font v3"
url="https://typingart.net/?p=44"
license=("custom:IPA Font License")
arch=("any")
source=("https://typingart.net/fontdata/hannari.zip")
sha256sums=('061a34c8f368eacb8bf64c1f304116ef48e4d5e02da6c8dd0db58ee899c0d7fb')
# Official source is typingart.net but does not support download without
# the official Referer header.
DLAGENTS=("https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --referer ${url}")

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 HannariMincho-Regular.otf "${pkgdir}"/usr/share/fonts/OTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 IPA_Font_License_Agreement_v1.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/"LICENCE
}
