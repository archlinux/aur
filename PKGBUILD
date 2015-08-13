# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-bcop
_pkgname=bcop
pkgver=0.8.10
pkgrel=1
pkgdesc="Compiz option code generator"
arch=('any')
url="http://www.compiz.org"
license=('GPL')
depends=("compiz-core>=${pkgver}" 'libxslt')
makedepends=('intltool')
conflicts=('compiz-bcop-dev')
source=("http://www.northfield.ws/projects/compiz/releases/${pkgver}/${_pkgname}.tar.gz")
md5sums=('8efcebe07f5c1e7d4365d639e4ebf324')

build()
{
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
