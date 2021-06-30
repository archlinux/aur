# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
pkgname=freedict-tools
epoch=1
_pkgver=0.5.0
pkgver=${_pkgver/-beta/beta}
pkgrel=1
pkgdesc="Tools to compile the Freedict dictionaries"
arch=('any')
url="https://freedict.org/"
license=('GPL' 'GPL3' 'CC-BY-SA')
depends=('make' 'libxslt' 'tar' 'gzip' 'dictd' 'perl' 'espeak-ng'
         'python>3.4' 'perl-xml-libxml' 'perl-xml-libxslt' 'iso-codes'
         'which')
source=("freedict-tools-${_pkgver}.tar.gz::https://api.github.com/repos/freedict/tools/tarball/${_pkgver}")
sha512sums=('efb0d373ec108c0ca87f18e8239f77be729027382d4e6dee7e262f455602c8c990718c1916be0a7fe8429b9c0c9f03956b5b13a285d2b4079fbe2915774da5e4')

package()
{
	mkdir -p "${pkgdir}/usr/lib/${pkgname}"

	# `*': Exclude `.gitignore'.
	cp -r freedict-tools-*/* "${pkgdir}/usr/lib/${pkgname}/"

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	ln -s /usr/lib/${pkgname}/README.md \
		"${pkgdir}/usr/share/doc/freedict/tools/"
}
