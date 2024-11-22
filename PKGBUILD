# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=neoss
pkgver=1.1.11
pkgrel=1
pkgdesc="Unix tool with terminal UI for visualizing socket statistics"
arch=(any)
url="https://github.com/pablolec/${pkgname}"
license=('custom:BSD-3-clause')
depends=(nodejs)
makedepends=(npm)
source=(${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('3bd5a6862d20fcadb1c580042c1e17011d920fd56d237522e5a3d24991db32b4e981d2708f29ee2c9dfb3dc9a1100530ec38df280cb6c015a36d84a549e61483')
PURGE_TARGETS=(*.gif *.yml)

package() {
  npm install -g --prefix "$pkgdir/usr" --cache npm-cache "${pkgname}-${pkgver}.tgz"
  chown -R root:root "$pkgdir/"
  install -d "$pkgdir/usr/share/licenses/${pkgname}/"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/"
}
