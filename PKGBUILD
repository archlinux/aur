# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Based on python-ufl-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=ufl
pkgname=python-${_base}
pkgdesc="Unified form language (stable)."
pkgver=2019.1.0
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('python-ufl-git')
depends=('python-numpy')
options=(!emptydirs)
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('213a56bfa2edb0365909fa6f110f970e582b10a3f5f1fd9a0e85254f1eefaa11')

build() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
