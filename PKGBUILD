# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-ufl-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=ufl
pkgname=python-${_base}
pkgdesc="Unified form language (stable)."
pkgver=2018.1.0
pkgrel=2
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('python-ufl-git')
depends=('python-numpy')
options=(!emptydirs)
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('ed191f5e0abfeb9922a68a6802f819e9cc6c50749472c01365319f66a5cfcbea')

build() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
