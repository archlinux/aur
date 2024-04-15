# Maintainer : Victor Savcenco <victor dot sav at linux dot com>

pkgname=uqm-megamod-data
_pkgname=uqm-megamod
pkgver=0.8.3
pkgrel=1
pkgdesc="Base content for the Ur-Quan Masters MegaMod by JHGuitarFreak (Kohr-Ah Death)."
arch=("any")
url="https://github.com/JHGuitarFreak/UQM-MegaMod-Content"
license=("custom:CC BY-NC-SA 2.5")

source=(
  "mm-${pkgver}-content.uqm::https://gigenet.dl.sourceforge.net/project/uqm-mods/MegaMod/${pkgver}/Content/mm-${pkgver}-content.uqm"
  LICENSE
  version.in
)

md5sums=(
  "0f65b232dec915fa17fdec70a85a00ae"
  "4f30efe3d129bd9a8bddd0d455c849f7"
  "c97a84d6a166d2e3a8815694162b80a8"
)

noextract=("mm-${pkgver}-content.uqm")

package() {
  mkdir -p \
    "${pkgdir}/usr/share/uqm-megamod/content" \
    "${pkgdir}/usr/share/uqm-megamod/content/addons" \
    "${pkgdir}/usr/share/uqm-megamod/content/base" \
    "${pkgdir}/usr/share/uqm-megamod/content/packages"
  
  sed 's/\${pkgver}/'"${pkgver}"'/g' "${srcdir}/version.in" > "${srcdir}/version"
  install -Dm644 "${srcdir}/version" "${pkgdir}/usr/share/uqm-megamod/content/version"
  install -Dm644 "${srcdir}/mm-${pkgver}-content.uqm" "${pkgdir}/usr/share/uqm-megamod/content/packages/mm-${pkgver}-content.uqm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
