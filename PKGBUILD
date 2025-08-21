# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=claude-code
_full_pkgname="@anthropic-ai/${pkgname}"
pkgver=1.0.86
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
b2sums=('ec84c92bb5c9cf502a25d78931a1a451e82d7307ed42ddeedf6bd6e9e68a1b4ade9e31a78393acd771248479b782aab1de9069f6537322951b73e328d817c142')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@anthropic-ai/claude-code/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
