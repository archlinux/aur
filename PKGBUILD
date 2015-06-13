# Maintainer: procrastinator

pkgname=flattr-icon-theme
pkgver=1.3
pkgrel=2
pkgdesc="Flattr is an icon theme for Linux desktops, the set is inspired by the latest flat design trend."
url="http://nitrux.in/store/flattr-icon-theme/"
arch=('any')
license=('custom:CC BY-SA 4.0')
source=("https://github.com/NitruxSA/flattr-icons/archive/v${pkgver}.tar.gz")
depends=('librsvg')
conflicts=('flattr-icon-theme-git' 'flattr-icons-kde' 'flattr-icons-kde-kaosx' 'flattr-icons-kde-kaosx-git')
sha256sums=('21d7486ab3723ce6b5c0d4fe2d4f97f6dbf8ce585874a01e53f2f77e4a43c2d5')

package() {
  install -dm775 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/flattr-icons-${pkgver}/Flattr" "${pkgdir}/usr/share/icons/Flattr"
  cp -r "${srcdir}/flattr-icons-${pkgver}/Flattr Dark" "${pkgdir}/usr/share/icons/Flattr Dark"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
  install -Dm644 "${pkgdir}/usr/share/icons/Flattr/LICENSE" "${pkgdir}/usr/share/licenses/Flattr/LICENSE"
  install -Dm644 "${pkgdir}/usr/share/icons/Flattr Dark/LICENSE" "${pkgdir}/usr/share/licenses/Flattr Dark/LICENSE"
}
