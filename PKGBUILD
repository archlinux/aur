# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-bcop
_pkgname=bcop
pkgver=0.8.12
pkgrel=1
pkgdesc="Compiz option code generator"
arch=('any')
url="http://blog.northfield.ws/compiz-release-announcement-0-8-12/"
license=('GPL')
depends=("compiz-core>=${pkgver}" 'libxslt')
makedepends=('intltool')
conflicts=('compiz-bcop-dev')
source=("compiz-bcop-${pkgver}.tar.xz::http://www.northfield.ws/projects/compiz/releases/${pkgver}/${_pkgname}.tar.xz")

build()
{
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

sha256sums=('570d19623d54b727ca7a11601236f3303770d9419b9bb44104c5871a5f688f77')
