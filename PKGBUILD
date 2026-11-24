# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tunnelmole-client
_npmname=tunnelmole
pkgver=2.4.3
pkgrel=1
pkgdesc="Expose local servers to the internet through Tunnelmole"
arch=('any')
url="https://github.com/robbie-cahill/tunnelmole-client"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/tunnelmole-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('092b60bcba1fbfd65d91ef69a173c9fc799b45780dcdbc00c17dc617fa8f27f1')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
