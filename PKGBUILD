# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=claude-code
_full_pkgname="@anthropic-ai/${pkgname}"
pkgver=0.2.48
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
b2sums=('ee5cee150b753b5b313c07671606fcd2dbbce243f7751103f6d653c0cfcba393694811efb9151c26c7fa4a86e52d2688a511fc4f64152fdb095bbab2543da9b8')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@anthropic-ai/claude-code/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
