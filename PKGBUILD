# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

DLAGENTS=('https::/usr/bin/curl -gqb "" -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=uqm-megamod-addon-hd
_pkgname=uqm-megamod
pkgver=0.8.1
pkgrel=1
pkgdesc="HD Graphics package for the Ur-Quan Masters MegaMod by Serosis."
arch=("any")
url="https://github.com/Serosis/UQM-MegaMod-Content"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-hd.uqm::https://files.serosis.net/MegaMod/${pkgver}/mm-${pkgver}-hd.uqm"
  "ATTRIBUTION.txt::https://raw.githubusercontent.com/Serosis/UQM-MegaMod-Content/master/addons/mm-hd/ATTRIBUTION.txt"
  LICENSE
)

md5sums=(
  "98f4b2cee09fb59f13661b5cafd017ec"
  "ff908319ce20057293c3c350854b390d"
  "4f30efe3d129bd9a8bddd0d455c849f7"
)

noextract=("mm-${pkgver}-hd.uqm")

package() {
  install -Dm644 "${srcdir}/mm-${pkgver}-hd.uqm" "${pkgdir}/usr/share/uqm-megamod/content/addons/mm-${pkgver}-hd.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ATTRIBUTION.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ATTRIBUTION.txt"
}
