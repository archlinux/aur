# Maintainer: Charlie Wolf <charlie@wolf.is>
pkgname=claude-code-router
_full_pkgname="@musistudio/${pkgname}"
pkgver=2.0.0
pkgrel=1
pkgdesc="This is a tool for routing Claude Code requests to different models, and you can customize any request."
arch=('any')
url="https://github.com/musistudio/claude-code-router"
license=('LicenseRef-claude-code-router')
depends=('nodejs' 'claude-code')
makedepends=('npm')
source=("https://registry.npmjs.org/$_full_pkgname/-/$pkgname-$pkgver.tgz")
b2sums=('5f22361e21a85d80c078920b04325feb227f527e43bc46eae745cc83fcfbf9183231a5dce4e3981a4e65d7d704b38c16ff28937a9e55c073c402daba9c110ed7')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@musistudio/claude-code-router/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
