# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=carboncode
_npmname=@carboncode/cli
pkgver=0.2.7
pkgrel=1
pkgdesc="Terminal coding tool built on DeepSeek"
arch=('any')
url="https://github.com/yapie0/carboncode"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('b652152aa02c8c69bad9c5b17060a34e1dd1f5592d0891f02bcd06eace950e18')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
