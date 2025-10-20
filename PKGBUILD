# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=claude-code-router
_full_pkgname="@musistudio/${pkgname}"
pkgver=1.0.63
pkgrel=1
pkgdesc="This is a tool for routing Claude Code requests to different models, and you can customize any request."
arch=('any')
url="https://github.com/musistudio/claude-code-router"
license=('LicenseRef-claude-code-router')
depends=('nodejs' 'claude-code')
makedepends=('npm')
source=("https://registry.npmjs.org/$_full_pkgname/-/$pkgname-$pkgver.tgz")
b2sums=('b0f35e6d61a4177d52a4a1f7fe0d6df173ca0c9e64d64cd82f0465a2cd7d8423305562931f59b2afc9a9ef565bdb5dbf3f0d550edac863f65fa5c66b5dd5fa6e')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@musistudio/claude-code-router/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
