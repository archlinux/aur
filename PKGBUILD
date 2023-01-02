# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Pablo Arias <pabloariasal[at]gmail[dot]com>
# Contributor: John Jenkins <twodopeshaggy[at]gmail[dot]com>

pkgname=ddgr
pkgver=2.1
pkgrel=2
pkgdesc="DuckDuckGo from the terminal"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python>=3.7.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fb6601ad533f2925d2d6299ab9e6dd48da0b75e99ef9ed9068f37e516380b5e6')

package() {
	cd "${pkgname}-${pkgver}"

	make PREFIX=/usr DESTDIR="${pkgdir}" install

	install -Dm 644 "auto-completion/fish/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm 644 "auto-completion/bash/${pkgname}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm 644 "auto-completion/zsh/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
