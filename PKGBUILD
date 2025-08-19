# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=gemini-cli-bin
pkgver=0.1.22 # datasource=github-releases depName=google-gemini/gemini-cli
pkgrel=2
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

sha256sums=('af0c667c9b0dedc53cc7a3f112a65daa02058c7233c144c2ccf80e129d40570e'
            '09d2d564b15d1a8be7713524b27aa8b10e55ae7cd8aeaf1e04e6059adda0de10')

package() {
	install -Dm755 "gemini-${pkgver}.js" "${pkgdir}/usr/bin/gemini"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
