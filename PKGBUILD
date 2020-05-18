# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Minimalist, fast, cross-platform terminal emulator'
arch=('x86_64')
url='https://terminalpp.com'
license=('MIT')
provides=('terminalpp')
depends=('libxft' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.rpm::https://github.com/terminalpp/terminalpp/releases/download/v${pkgver}/terminalpp.rpm"
				"ropen.rpm::https://github.com/terminalpp/terminalpp/releases/download/v${pkgver}/ropen.rpm"
				"tpp-bypass::https://github.com/terminalpp/terminalpp/releases/download/v${pkgver}/tpp-bypass-Ubuntu-18.04"
				'LICENSE::https://github.com/terminalpp/terminalpp/raw/master/LICENSE.md')
sha256sums=('5323ddd89225b3b4617c55fb14cc2e2af297c570112488a197a029acd5fe4000'
						'a776b6cd16ed0d86b58ce3a272aa3445d15a7307ac3fd875baebab75e12930f2'
						'66c24d2d8720851bcf52a2e60af8915a40b9fa5c66793e029952131a386e1429'
						'5560b44d8082b623c288cefd5de25c8be7b6b3711bb2f4af070deb057d2d8de7')

package() {
	install -Dm755 tpp-bypass -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	cp -aR usr "${pkgdir}"
	rm -rf "${pkgdir}/usr/lib"
}
# vim:set ts=2 sw=2 et: