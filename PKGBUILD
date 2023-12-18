# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=neoss
pkgver=1.1.10
pkgrel=1
pkgdesc="Unix tool with terminal UI for visualizing socket statistics"
arch=(any)
url="https://github.com/pablolec/${pkgname}"
license=('custom:BSD-3-clause')
depends=(nodejs)
makedepends=(npm)
source=(${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('8aadeb0cb753b76f4c061eb007151712832e4b7b80c3903ddb47b1a4e545843ffb1d623203fa406d87aed294f0e4899ebfffada8b25ead800827268df4a5e67e')
PURGE_TARGETS=(*.gif *.yml)

package() {
  npm install -g --prefix "$pkgdir/usr" --cache npm-cache "${pkgname}-${pkgver}.tgz"
  chown -R root:root "$pkgdir/"
  install -d "$pkgdir/usr/share/licenses/${pkgname}/"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/"
}
