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
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${_pkgver}" 'libxslt')
makedepends=('intltool')
conflicts=('compiz-bcop-dev' 'compiz-bcop-git')
source=("${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz")

build()
{
	cd "${srcdir}/${_upstream}-${pkgver}"
	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_upstream}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

sha256sums=('5e495317ba6f17eaba8c7316e2a0c9a9b0b8d5b692dd7548ab0d90ba18891174')
