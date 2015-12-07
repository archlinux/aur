# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: msimav  <mustafa1991 at gmail dot com>

pkgname=nitrux-icon-theme
pkgver=3.5.3
pkgrel=1
pkgdesc="New squared icon set for Linux that sports clean lines, smooth gradients, and simple icon logos"
url="http://nitrux.in/store/nitrux-icon-theme/"
arch=('any')
license=('custom:Creative Commons')
source=("https://launchpad.net/~nitrux-team/+archive/ubuntu/nitrux-artwork/+files/${pkgname}_${pkgver}.tar.gz")
depends=('librsvg')
options=(!strip)
md5sums=('92c680071d5c41f80ad324072db1a428')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/${pkgname}-${pkgver}/Nitrux" "${pkgdir}/usr/share/icons/${pkgname}"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;

  install -Dm644 "${pkgdir}/usr/share/"{icons,licenses}"/${pkgname}/COPYING"
}
