# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compizconfig-python"
_pkgver=0.8.12
_micro=".1"

pkgname=compizconfig-python
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Compizconfig bindings for python"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${pkgver}" 'libcompizconfig' 'glib2' 'python2' 'libxrandr' 'libsm' 'libxdamage')
makedepends=('cython' 'intltool' 'pkgconfig')
options=('!libtool')
conflicts=('compizconfig-python-git')
source=("${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz")

build()
{
	cd "${srcdir}/${_upstream}-${pkgver}"

	NOCONFIGURE=1 ./autogen.sh
	PYTHON=python2 ./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_upstream}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

sha256sums=('ca905e3d3450ed2748d992065d53d104033e7402b1ea4789188c0d3fcce2b39a')
