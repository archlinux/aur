# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=git-contrib-calendar
_npmname=git-contrib-calendar
pkgver=1.3.0
pkgrel=1
pkgdesc="Git contributions calendar for the terminal"
arch=('any')
url="https://github.com/giannisp/git-contrib-calendar"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/git-contrib-calendar-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('595deedcc95ca5f2af4b8eadba203880b558f1d2400381578751b7c67c309f71')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
