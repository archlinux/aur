# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

DLAGENTS=('https::/usr/bin/curl -gqb "" -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=uqm-megamod-data
_pkgname=uqm-megamod
pkgver=0.8.1
pkgrel=1
pkgdesc="Base content for the Ur-Quan Masters MegaMod by Serosis."
arch=("any")
url="https://github.com/Serosis/UQM-MegaMod-Content"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-content.uqm::https://files.serosis.net/MegaMod/${pkgver}/mm-${pkgver}-content.uqm"
  LICENSE
  version
)

md5sums=(
  "6ca00a5a2c7db3d60a0d5828bd921ce8"
  "4f30efe3d129bd9a8bddd0d455c849f7"
  "b2732e9de2e18b31eeb50030ade062f7"
)

noextract=("mm-${pkgver}-content.uqm")

package() {
  mkdir -p \
    "${pkgdir}/usr/share/uqm-megamod/content" \
    "${pkgdir}/usr/share/uqm-megamod/content/addons" \
    "${pkgdir}/usr/share/uqm-megamod/content/base" \
    "${pkgdir}/usr/share/uqm-megamod/content/packages"
  
  install -Dm644 "${srcdir}/version" "${pkgdir}/usr/share/uqm-megamod/content/version"
  install -Dm644 "${srcdir}/mm-${pkgver}-content.uqm" "${pkgdir}/usr/share/uqm-megamod/content/packages/mm-${pkgver}-content.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
