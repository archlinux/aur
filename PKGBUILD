# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=claude-code
_full_pkgname="@anthropic-ai/${pkgname}"
pkgver=0.2.39
pkgrel=1
pkgdesc="An agentic coding tool that lives in your terminal"
arch=('any')
url="https://github.com/anthropics/claude-code"
license=('custom')
depends=()
makedepends=('npm')
optdepends=(
	'git: allow Claude to use git'
	'github-cli: interact with GitHub'
	'glab: interact with GitLab'
	'ripgrep: enhanced file search'
)
source=("https://registry.npmjs.org/$_full_pkgname/-/$pkgname-$pkgver.tgz")
b2sums=('aef5b0c2b6c6f2d8159eaee41d44a4cdbb3f594d86d688399da9db972fde812b9d83e7026b6edb90c81fccb321438f76e5ccb9c041bae42f09138049643516b4')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@anthropic-ai/claude-code/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
