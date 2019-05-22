# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Based on python-instant-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=mshr
pkgname=python-${_base}
pkgdesc="Mesh generation component of FEniCS (python interface) (stable)."
pkgver=2019.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics')
conflicts=('python-mshr-git')
depends=('mshr=2019.1.0')
makedepends=('git')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('0be8f261e7370404863067badadd230dbd55d54f6ffeba15728f4a9bfc856173')

build() {
	cd ${srcdir}/${_base}-${pkgver}/python
	python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}/python
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
