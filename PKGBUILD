# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=gemini-cli-bin
pkgver=0.3.1 # datasource=github-releases depName=google-gemini/gemini-cli
pkgrel=1
pkgdesc='An open-source AI agent that brings the power of Gemini directly into your terminal.'
arch=('any')
url='https://github.com/google-gemini/gemini-cli'
license=('Apache-2.0')
depends=('nodejs')
provides=('gemini-cli')
conflicts=('gemini-cli' 'gemini-cli-git')

source=(
	"gemini-${pkgver}.js::${url}/releases/download/v${pkgver}/gemini.js"
	"LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)

sha256sums=('8345d0d0c1301c27634fac421cab2cba67c9a4e0e8045529ea2e6a7533c71c30'
            '09d2d564b15d1a8be7713524b27aa8b10e55ae7cd8aeaf1e04e6059adda0de10')

package() {
	install -Dm755 "gemini-${pkgver}.js" "${pkgdir}/usr/bin/gemini"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
