# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=claude-code
_full_pkgname="@anthropic-ai/${pkgname}"
pkgver=1.0.6
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
b2sums=('236aab0e175f31d27c3cb5d19ab7e5127820b51c171e1fcd54e7cb4b873df9d7f0987efa90ee2b4fdfbb059dc3565ad5af2a718a5c13da63bc1a703bd98b5b02')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@anthropic-ai/claude-code/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
