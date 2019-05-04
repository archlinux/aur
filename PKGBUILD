# Maintainer: jmx <jmaibaum@gmail.com>

pkgname=ltc-tools
pkgver=0.7.0
pkgrel=1
pkgdesc='Commandline tools to deal with linear-timecode (LTC)'
arch=('x86_64')
url="https://github.com/x42/ltc-tools"
license=('GPL2')
depends=('jack' 'libltc')
source=("https://github.com/x42/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1e11988e81b345357ad2b51834694b4d536beddfcd534504e6e5c537b17fc845aba17f2b3aa5d0898097ad1500d1bc9e20b27188d37f806887b9c88ddf635d8b')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
