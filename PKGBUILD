# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: msimav  <mustafa1991 at gmail dot com>

pkgname=nitrux-icon-theme
pkgver=3.5.4
pkgrel=1
pkgdesc="New squared icon set for Linux that sports clean lines, smooth gradients, and simple icon logos"
url="https://github.com/Nitrux/nitrux-icon-theme"
arch=('any')
license=('custom:Creative Commons')
source=("https://github.com/Nitrux/nitrux-icon-theme/archive/$pkgver.tar.gz")
depends=('librsvg')
options=(!strip)
sha512sums=('2798541e8b158d95a1deb6c7fbdb721a3b584e2f7aaf4f8eb491d374eebadc7f052aa691b59c0da7435208d1c4b51f6225225968a22001e01722a207a3124dea')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/${pkgname}-${pkgver}/Nitrux" "${pkgdir}/usr/share/icons/${pkgname}"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;

  install -Dm644 "${pkgdir}/usr/share/"{icons,licenses}"/${pkgname}/COPYING"
}

