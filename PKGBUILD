# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compizconfig-python"
_pkgver=0.8.12
_micro=""

pkgname=compizconfig-python
pkgver="${_pkgver}${_micro}"
pkgrel=2
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

	#NOCONFIGURE=1 ./autogen.sh
	PYTHON=python2 ./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_upstream}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

sha256sums=('b86dffa0884d2294aaa33d1d9e07ff652e9e54d071b853948d320f6e12783178')
