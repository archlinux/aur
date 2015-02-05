# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compizconfig-python
pkgver=0.8.10
pkgrel=1
pkgdesc="Compizconfig bindings for python"
arch=('i686' 'x86_64')
url="http://opencompositing.org"
license=('GPL')
depends=("compiz-core>=${pkgver}" 'libcompizconfig' 'glib2' 'python2' 'libxrandr' 'libsm' 'libxdamage')
makedepends=('intltool' 'pkgconfig' 'pyrex')
options=('!libtool')
conflicts=('compizconfig-python-git')
source=("http://www.northfield.ws/projects/compiz/releases/${pkgver}/${pkgname}.tar.gz")
md5sums=('83040ae44d6c558e02a07ac233424644')

build()
{
	cd "${srcdir}/${pkgname}"
	./autogen.sh
	PYTHON=python2 ./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
