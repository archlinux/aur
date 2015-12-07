# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: localizator <localizator at ukr dot net>

pkgname=nitrux-icon-theme-kde
pkgver=3.5.3
pkgrel=1
pkgdesc="The KDE version of the Nitrux OS Icons"
url="http://nitrux.in/store/nitrux-for-kde/"
arch=('any')
license=('Creative Commons')
source=("https://launchpad.net/~nitrux-team/+archive/ubuntu/nitrux-artwork/+files/${pkgname}_${pkgver}.tar.gz")
depends=('librsvg')
options=(!strip)
md5sums=('b938bf54023229dc855d34965c295c03')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/${pkgname}-${pkgver}/Nitrux" "${pkgdir}/usr/share/icons/${pkgname}"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;

  install -Dm644 "${pkgdir}/usr/share/"{icons,licenses}"/${pkgname}/COPYING"
}
