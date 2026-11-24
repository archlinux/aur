# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sea-trader
_npmname=ctrader
pkgver=3.2.0
pkgrel=1
pkgdesc="Terminal trading game inspired by Taipan!"
arch=('any')
url="https://github.com/zyishai/sea-trader"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/ctrader-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('a04a08662e856bbcdfe8eb5b673995e96d561eed5da03265bb89119884a3d007')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
