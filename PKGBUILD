# Maintainer: procrastinator

pkgname=flattr-icon-theme
pkgver=1.2
pkgrel=1
pkgdesc="Flattr is an icon theme for Linux desktops, the set is inspired by the latest flat design trend."
url="http://nitrux.in/store/flattr-icon-theme/"
arch=('any')
license=('custom:CC BY-SA 4.0')
source=("https://github.com/NitruxSA/flattr-icons/archive/v${pkgver}.tar.gz")
depends=('librsvg')
conflicts=('flattr-icon-theme-git' 'flattr-icons-kde' 'flattr-icons-kde-kaosx' 'flattr-icons-kde-kaosx-git')
sha256sums=('0dce7e35b48c3c2a02716cca1ad7d744eb8bfbee20706e955b0cf445273d6224')

package() {
  install -dm775 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/flattr-icons-${pkgver}" "${pkgdir}/usr/share/icons/${pkgname}"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
  install -Dm644 "${pkgdir}/usr/share/icons/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
