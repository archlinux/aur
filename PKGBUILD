# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_pkgname=freedict-tools
pkgname=${_pkgname}-svn
epoch=1
pkgver=r145
pkgrel=2
pkgdesc="Tools to compile the Freedict dictionaries"
arch=('any')
url="http://www.freedict.org/"
license=('GPL' 'GPL3' 'CC-BY-SA')
makedepends=('subversion')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("svn+https://github.com/freedict/tools/trunk")
md5sums=('SKIP')

pkgver()
{
	cd trunk
	local _ver="$(svnversion)"
	printf "r%s" "${_ver//[[:alpha:]]}"
}

package()
{
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
	cp -r trunk/. "${pkgdir}/usr/lib/${_pkgname}/"

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	ln -s /usr/lib/${_pkgname}/README.md \
		"${pkgdir}/usr/share/doc/freedict/tools/"
}
