# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=claude-code-router
_full_pkgname="@musistudio/${pkgname}"
pkgver=1.0.65
pkgrel=1
pkgdesc="This is a tool for routing Claude Code requests to different models, and you can customize any request."
arch=('any')
url="https://github.com/musistudio/claude-code-router"
license=('LicenseRef-claude-code-router')
depends=('nodejs' 'claude-code')
makedepends=('npm')
source=("https://registry.npmjs.org/$_full_pkgname/-/$pkgname-$pkgver.tgz")
b2sums=('e5b1c560a3d9d20da1f75eb551001b16e1d784a5d8855357ff99ba442fde163a11153417733db7baf187b3160ce4ca7f1a905bd74473334e1c9912d8e40c5334')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@musistudio/claude-code-router/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
