# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=claude-code-router
_full_pkgname="@musistudio/${pkgname}"
pkgver=1.0.9
pkgrel=1
pkgdesc="This is a tool for routing Claude Code requests to different models, and you can customize any request."
arch=('any')
url="https://github.com/musistudio/claude-code-router"
license=('LicenseRef-claude-code-router')
depends=('nodejs' 'claude-code')
makedepends=('npm')
source=("https://registry.npmjs.org/$_full_pkgname/-/$pkgname-$pkgver.tgz")
b2sums=('6ba2150fda1377a490b2e934e84513305c0cf6d85dd3caf83bdb632652dd1151c0ae13cdb1fd136d3ec9feceb795e13df7c5d39ada3cb6cc458c913a867e913e')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@musistudio/claude-code-router/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
