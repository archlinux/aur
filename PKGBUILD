# Maintainer: Ivan Kovmir <ikovmir@darkn.space>
pkgname=untldr
pkgver=1.0.0
pkgrel=3
pkgdesc='Minimalist tldr command line client'
arch=('any')
url="https://github.com/unInstance/untldr"
license=('Apache')
depends=('curl' 'libarchive')
makedepends=('gcc' 'ccache' 'make')
conflicts=('tldr')
options=('ccache')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/unInstance/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('b6c3705dcdde1bbd48e29354df383a3e')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
