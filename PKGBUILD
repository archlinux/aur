# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=neoss
pkgver=1.1.9
pkgrel=1
pkgdesc="Unix tool with terminal UI for visualizing socket statistics"
arch=(any)
url="https://github.com/pablolec/${pkgname}"
license=('custom:BSD-3-clause')
depends=(nodejs)
makedepends=(npm)
source=(${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('0db4273fd9a65bf759633a018fd162fbaf458e401768c4d02d0772f413422aec96e1c48aadfb4bc4feab0d8911e8f31dc3ce8c118e3b9b427c18f2c609b2346f')
PURGE_TARGETS=(*.gif *.yml)

package() {
  npm install -g --prefix "$pkgdir/usr" --cache npm-cache "${pkgname}-${pkgver}.tgz"
  chown -R root:root "$pkgdir/"
  install -d "$pkgdir/usr/share/licenses/${pkgname}/"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/"
}
