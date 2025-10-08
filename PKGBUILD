# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=gemini-cli-bin
pkgver=0.8.1 # datasource=github-releases depName=google-gemini/gemini-cli
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

sha256sums=('491b65f053cc234541cf48739b2bed1983cede67679bad20bb6ce54ad6f9afdf'
            '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')

package() {

	install -Dm755 "gemini-${pkgver}.js" "${pkgdir}/usr/lib/${pkgname}/gemini.mjs"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mkdir -p "${pkgdir}/usr/bin"
	ln -sr "${pkgdir}/usr/lib/${pkgname}/gemini.mjs" "${pkgdir}/usr/bin/gemini"
}
