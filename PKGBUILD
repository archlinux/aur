# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
pkgname=freedict-tools
pkgver=0.5.0_beta.4
_pkgver=${pkgver/_/-}
pkgrel=2
pkgdesc="Tools to compile the Freedict dictionaries"
arch=('any')
url="https://freedict.org/"
license=('GPL' 'GPL3' 'CC-BY-SA')
depends=('make' 'libxslt' 'tar' 'gzip' 'dictd' 'perl' 'espeak-ng'
         'python>3.4' 'perl-xml-libxml' 'perl-xml-libxslt' 'iso-codes'
         'which')
source=("freedict-tools_${_pkgver}.tar.gz::https://api.github.com/repos/freedict/tools/tarball/${_pkgver}")
sha512sums=('2ec09762bdac9e61da27104422ff89e4521e8abb3f4a1b3853a19038238701fa7ee28af327f369fc1bcdd44423a8c7050b6ec3ed5f613cb208953cbf54773889')

package()
{
	mkdir -p "${pkgdir}/usr/lib/${pkgname}"
	cp -r freedict-tools-*/. "${pkgdir}/usr/lib/${pkgname}/"

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	ln -s /usr/lib/${pkgname}/README.md \
		"${pkgdir}/usr/share/doc/freedict/tools/"
}
