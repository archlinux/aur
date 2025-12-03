# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=claude-code-router
_full_pkgname="@musistudio/${pkgname}"
pkgver=1.0.72
pkgrel=1
pkgdesc="This is a tool for routing Claude Code requests to different models, and you can customize any request."
arch=('any')
url="https://github.com/musistudio/claude-code-router"
license=('LicenseRef-claude-code-router')
depends=('nodejs' 'claude-code')
makedepends=('npm')
source=("https://registry.npmjs.org/$_full_pkgname/-/$pkgname-$pkgver.tgz")
b2sums=('442c762e4c9c037a24473781d461ca3d6570bc7ad5046d00b9e8fa00c30a8c5d3b510314727eee8ec386ff7b873fd46049fc34bb436bc6670d318ccc06a16cfd')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@musistudio/claude-code-router/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
