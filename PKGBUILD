# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=neoss
pkgver=1.1.7
pkgrel=1
pkgdesc="Unix tool with terminal UI for visualizing socket statistics"
arch=(any)
url="https://github.com/pablolec/${pkgname}"
license=('custom:BSD-3-clause')
depends=(nodejs)
makedepends=(npm)
source=(${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('35c51fd1782c77cfa1e41f5d8ae25578e9c86caad6fba106f4b9f21cd0e16acf1e7f0390ba4214a8355e53d0877f33834b50dadd977a2a78fd83fe1b6ac822f4')

PURGE_TARGETS=(*.gif *.yml)

package() {
	npm install -g --prefix "$pkgdir/usr" --cache npm-cache "${pkgname}-${pkgver}.tgz"
	chown -R root:root "$pkgdir/"
	install -d "$pkgdir/usr/share/licenses/${pkgname}/"
	ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/"
}
