# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=gemini-cli-bin
pkgver=0.1.20 # datasource=github-releases depName=google-gemini/gemini-cli
pkgrel=1
pkgdesc='An open-source AI agent that brings the power of Gemini directly into your terminal.'
arch=('any')
url='https://github.com/google-gemini/gemini-cli'
license=('Apache-2.0')
depends=('nodejs')
provides=('gemini-cli')

source=(
	"gemini-${pkgver}.js::${url}/releases/download/v${pkgver}/gemini.js"
	"LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)

sha256sums=('cd57a1693b6eec4f43e08528056f47bb8388b8348ffef7a9e40064e5a30dd4ae'
            '09d2d564b15d1a8be7713524b27aa8b10e55ae7cd8aeaf1e04e6059adda0de10')

package() {
	install -Dm755 "gemini-${pkgver}.js" "${pkgdir}/usr/bin/gemini"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
