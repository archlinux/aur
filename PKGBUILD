# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>

pkgname=lib50
_module='lib50' # PyPI specific
pkgver='2.0.8'
pkgrel=1
pkgdesc="This is lib50, CS50's own internal library used in many of its tools."
url="https://github.com/cs50/lib50"
depends=('python' 'python-jellyfish' 'python-attrs')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
groups=('cs50')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('6d3a0bd46499446de14eedc8d948d152dd0e806e0c94a7ce51b8f496fffd6dab')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
