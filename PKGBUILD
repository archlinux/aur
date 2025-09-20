# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=gemini-cli-bin
pkgver=0.5.5 # datasource=github-releases depName=google-gemini/gemini-cli
pkgrel=1
pkgdesc='An open-source AI agent that brings the power of Gemini directly into your terminal.'
arch=('any')
url='https://github.com/google-gemini/gemini-cli'
license=('Apache-2.0')
depends=('nodejs')
provides=('gemini-cli')
conflicts=('gemini-cli' 'gemini-cli-git')

source=("gemini-${pkgver}.js::${url}/releases/download/v${pkgver}/gemini.js"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")

sha256sums=('c526c801314b1b9b7a90823f9fee839a5d3bf15a2a3edff22ea247e33b03f7b1'
            '09d2d564b15d1a8be7713524b27aa8b10e55ae7cd8aeaf1e04e6059adda0de10')

package() {

	install -Dm755 "gemini-${pkgver}.js" "${pkgdir}/usr/lib/${pkgname}/gemini.mjs"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mkdir -p "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/usr/lib/${pkgname}/gemini.mjs" "${pkgdir}/usr/bin/gemini"
}
