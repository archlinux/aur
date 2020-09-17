#
# Maintainer: Uffe Jakobsen <_microtop_|_at_|_starion_|_dot_|_dk_>
#
pkgname=acme-upstream
_pkgname=acme
pkgver=0.97
pkgrel=1
pkgdesc="Cross-assembler for MOS 6502, 65C02 and 65816 CPUs - SourceForge upstream release"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/acme-crossass/"
#url="https://github.com/uffejakobsen/acme"
source=(https://github.com/uffejakobsen/acme/archive/${pkgver}.tar.gz)
#url="http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/acme"
#source=(http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/${pkgname}/current/${_pkgname}${pkgver}src.tar.bz2)
license=('GPL')
md5sums=('65de22b31ec97b6270d498aa36d54207')
#depends=('glibc')
provides=('acme')
conflicts=('acme' 'acme-git')

build()
{
	cd "${srcdir}/${_pkgname}-${pkgver}/src"
	make || return 1
}

package()
{
	cd "${srcdir}/${_pkgname}-${pkgver}/src"
	install -D -m755 acme ${pkgdir}/usr/bin/acme
}

#
# EOF
#
