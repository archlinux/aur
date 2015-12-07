# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ivan Petruk <localizator at ukr dot net>

pkgname=compass-icon-theme-kde
pkgver=1.3.8
pkgrel=1
pkgdesc="The KDE version of the alternative Nitrux OS Icons"
url="http://nitrux.in/store/compass-for-kde/"
license=('custom:Creative Commons')
arch=('any')
depends=('librsvg')
source=("https://launchpad.net/~nitrux-team/+archive/ubuntu/nitrux-artwork/+files/${pkgname}_${pkgver}.tar.gz")
md5sums=('f0e253267a20d8134660f3e056f8b7e7')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/${pkgname}-${pkgver}/Compass" "${pkgdir}/usr/share/icons/${pkgname}"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;

  install -Dm644 "${pkgdir}/usr/share/"{icons,licenses}"/${pkgname}/COPYING"
}
