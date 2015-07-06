# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: localizator <localizator at ukr dot net>

pkgname=nitrux-icon-theme-kde
pkgver=3.5.3
pkgrel=1
pkgdesc="The KDE version of the Nitrux OS Icons"
url="http://nitrux.in/store/nitrux-for-kde/"
arch=('any')
license=('Creative Commons')
source=("http://nitrux.in/downloads/files/free/${pkgname}-${pkgver}.tar.gz")
depends=('librsvg')
options=(!strip)
md5sums=('f6157a19e14de09cd6f6f11a5db5f018')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/Nitrux" "${pkgdir}/usr/share/icons/${pkgname}"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;

  install -Dm644 "${pkgdir}/usr/share/"{icons,licenses}"/${pkgname}/COPYING"
}
