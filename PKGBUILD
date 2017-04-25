# Maintainer: Antergos Developers <dev@antergos.com>

pkgname=python-whither
_module="${pkgname#*-}"
pkgver=0.3.2
pkgrel=1
pkgdesc='Desktop application SDK for creating Universal Linux Applications.'
url="https://github.com/antergos/whither"
depends=('python-pyqt5' 'qt5-webengine' 'python-ruamel-yaml')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/w/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('89ae56f43a096e10f4209df3808bc3b7')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# -*- mode: bash;-*-
