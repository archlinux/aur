# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
pkgname=freedict-tools
pkgver=0.5.0_beta.2
_pkgver=${pkgver/_/-}
pkgrel=2
pkgdesc="Tools to compile the Freedict dictionaries"
arch=('any')
url="http://www.freedict.org/"
license=('GPL' 'GPL3' 'CC-BY-SA')
depends=('libxslt' 'espeak')
source=("freedict-tools_${_pkgver}.tar.gz::https://github.com/freedict/tools/archive/${_pkgver}.tar.gz")
sha512sums=('c26d3dd6b7502e165ee5eb57f99d89a62a60dd70ebf0fa54830107d6948a373dbaa39672d691b9afd949b0ea543e06edeff4af7472e7e38650e8dc426b8261d3')

package()
{
	mkdir -p "${pkgdir}/usr/lib/${pkgname}"
	cp -r tools-${_pkgver}/. "${pkgdir}/usr/lib/${pkgname}/"

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	ln -s /usr/lib/${pkgname}/README.md \
		"${pkgdir}/usr/share/doc/freedict/tools/"
}
