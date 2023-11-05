# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=neoss
pkgver=1.1.8
pkgrel=1
pkgdesc="Unix tool with terminal UI for visualizing socket statistics"
arch=(any)
url="https://github.com/pablolec/${pkgname}"
license=('custom:BSD-3-clause')
depends=(nodejs)
makedepends=(npm)
source=(${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('9b29b6c9278bc1b27d57ac2a1a4bf3fcb149bfed250b9da163c66ea0c64267df9bdacc160305fdd27720624cea06d8d91da41247798e5d29e455cf0a835460c8')
PURGE_TARGETS=(*.gif *.yml)

package() {
  npm install -g --prefix "$pkgdir/usr" --cache npm-cache "${pkgname}-${pkgver}.tgz"
  chown -R root:root "$pkgdir/"
  install -d "$pkgdir/usr/share/licenses/${pkgname}/"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/"
}
