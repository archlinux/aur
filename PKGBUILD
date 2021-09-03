# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

DLAGENTS=('https::/usr/bin/curl -gqb "" -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=uqm-megamod-addon-hd
_pkgname=uqm-megamod
pkgver=0.8.0.85
pkgrel=1
pkgdesc="HD Graphics package for the Ur-Quan Masters MegaMod by Serosis."
arch=("any")
url="https://github.com/Serosis/UQM-MegaMod-Content"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "https://files.serosis.net/MegaMod/${pkgver}/mm-${pkgver}-hd.uqm"
  "https://raw.githubusercontent.com/Serosis/UQM-MegaMod-Content/master/addons/mm-hd/ATTRIBUTION.txt"
  LICENSE
)

md5sums=(
  "f2a0f661fc9b07b4c800a2c6b78ed8ea"
  "e4bd4924cef83fd3594ea4154d141e7a"
  "4f30efe3d129bd9a8bddd0d455c849f7"
)

noextract=("mm-${pkgver}-hd.uqm")

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-hd.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-hd.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ATTRIBUTION.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ATTRIBUTION.txt"
}
