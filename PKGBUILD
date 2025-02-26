# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=claude-code
_full_pkgname="@anthropic-ai/${pkgname}"
pkgver=0.2.14
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
b2sums=('59a5596fe6be39b89b0fc3eff3384c537b928d82838f674c1b69baeeafb44b9f2a411f1f8b1541a08874cf612f4c9d27b1877da395051aea2b71c69b71f9aaaf')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

	# Install from location in pkgdir since we have noextract.
	install -Dm644 "${pkgdir}/usr/lib/node_modules/@anthropic-ai/claude-code/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
