# Maintainer: Christopher Cooper <christopher@cg505.com>
# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=claude-code
_full_pkgname="@anthropic-ai/${pkgname}"
pkgver=2.0.17
pkgrel=1
pkgdesc="An agentic coding tool that lives in your terminal"
arch=('any')
url="https://github.com/anthropics/claude-code"
license=('LicenseRef-claude-code')
depends=('nodejs')
makedepends=('npm')
optdepends=(
	'git: allow Claude to use git'
	'github-cli: interact with GitHub'
	'glab: interact with GitLab'
	'ripgrep: enhanced file search'
)
source=("https://registry.npmjs.org/$_full_pkgname/-/$pkgname-$pkgver.tgz")
b2sums=('8a3360488f47cdb8d3f543814391a4bc9db74ff39062851102953903f9bc128af0aeaa3efa2ae0902ad6abd00ce2beb9f421bdabd376ffe20fe0d488738192e5')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@anthropic-ai/claude-code/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
