# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: turborob <robertcgagne at gmail dot com>
# Contributor: foalsrock <foalsrock at gmail dot com>

pkgname=compass-icon-theme
pkgver=1.3.8
pkgrel=1
pkgdesc='The alternative icon theme for the .nitrux Operating System'
url='http://nitrux.in/store/artwork-store/compass-icon-theme/'
license=('cc-by-nc-nd-4.0')
depends=('librsvg')
arch=('any')
source=("https://launchpad.net/~nitrux-team/+archive/ubuntu/nitrux-artwork/+files/${pkgname}_${pkgver}.tar.gz")
md5sums=('da6069af00ec59924874c1d9636f9ffe')

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/${pkgname}-${pkgver}/Compass" "${pkgdir}/usr/share/icons/${pkgname}"

  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;

  install -Dm644 "${pkgdir}/usr/share/"{icons,licenses}"/${pkgname}/COPYING"
}
