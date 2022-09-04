# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Pablo Arias <pabloariasal[at]gmail[dot]com>
# Contributor: John Jenkins <twodopeshaggy[at]gmail[dot]com>

pkgname=ddgr
pkgver=2.0
pkgrel=3
pkgdesc="DuckDuckGo from the terminal"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python>=3.7')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7e46430b0a8c479a5feca832adb73f2f09804bf603dedc50f4cf2e1da4c75f88')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make PREFIX=/usr DESTDIR="${pkgdir}" install

	install -Dm 644 "auto-completion/fish/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm 644 "auto-completion/bash/${pkgname}-completion.bash" "${pkgdir}/etc/bash_completion.d/${pkgname}"
	install -Dm 644 "auto-completion/zsh/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
