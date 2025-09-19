# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=gemini-cli-bin
pkgver=0.5.4 # datasource=github-releases depName=google-gemini/gemini-cli
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

sha256sums=('af0bcbe5c8f13ce0b5656a29a39e3e23535618c7b09e6ea54d397a6213654819'
            '09d2d564b15d1a8be7713524b27aa8b10e55ae7cd8aeaf1e04e6059adda0de10')

package() {

	install -Dm755 "gemini-${pkgver}.js" "${pkgdir}/usr/lib/${pkgname}/gemini.mjs"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mkdir -p "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/usr/lib/${pkgname}/gemini.mjs" "${pkgdir}/usr/bin/gemini"
}
