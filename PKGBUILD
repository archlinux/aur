# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-bcop"
_pkgver=0.8.14
_micro=""

pkgname=compiz-bcop
_pkgname=bcop
pkgver="${_pkgver}${_micro}"
pkgrel=2
pkgdesc="Compiz option code generator"
arch=('any')
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${_pkgver}" 'libxslt')
makedepends=('intltool')
conflicts=('compiz-bcop-dev' 'compiz-bcop-git')
source=("${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2")

build()
{
	cd "${srcdir}/${_upstream}-v${pkgver}"
	NOCONFIGURE=1 ./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_upstream}-v${pkgver}"
	make DESTDIR="${pkgdir}" install
}

sha256sums=('034e5ac98adac1d0de88d7fc0770c27712550ed81b26df08cf7a60e46eb15e79')
