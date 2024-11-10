# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=alder
pkgver=2.0.0
pkgrel=3
pkgdesc="A minimal implementation of the UNIX tree command with colors"
arch=('any')
url='https://github.com/aweary/alder'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@aweary/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('c2cb747b93df87d7bd39e38167f6d21ade5234d43974cc4659f73981a84521a7')

package() {
	npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"

	chown -R root:root "${pkgdir}/"

	install -Dm 644 "${pkgdir}/usr/lib/node_modules/@aweary/${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm 644 "${pkgdir}/usr/lib/node_modules/@aweary/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
