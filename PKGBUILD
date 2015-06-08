# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: msimav  <mustafa1991 at gmail dot com>

pkgname=nitrux-icon-theme
pkgver=3.5.1
pkgrel=1
pkgdesc="New squared icon set for Linux that sports clean lines, smooth gradients, and simple icon logos"
url="http://nitrux.in/store/nitrux-icon-theme/"
arch=('any')
license=('custom:Creative Commons')
source=("http://nitrux.in/downloads/files/free/${pkgname}-${pkgver}.tar.gz")
depends=('librsvg')
options=(!strip)
md5sums=('538d07a0cf198ffb708251572450d856')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/Nitrux" "${pkgdir}/usr/share/icons/${pkgname}"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;

  install -Dm644 "${pkgdir}/usr/share/"{icons,licenses}"/${pkgname}/COPYING"
}
