# Maintainer: Antergos Developers <dev@antergos.com>

pkgname=python-whither
_module="${pkgname#*-}"
pkgver=0.2.5
pkgrel=1
pkgdesc='Desktop application SDK for creating Universal Linux Applications.'
url="https://github.com/antergos/whither"
depends=('python-pyqt5' 'qt5-webengine' 'python-ruamel-yaml')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/w/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('48bb8c3ea43df1eb47bc00a2e1ac196f')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# -*- mode: bash;-*-
