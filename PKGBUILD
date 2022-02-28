_pipname=yamk
pkgname="python-${_pipname}"
pkgver=2.3.2
pkgrel=1
pkgdesc="Yet another make"
arch=('any')
url="https://github.com/spapanik/yamk"
license=('MIT')
depends=('python-tomli' 'python-yaml')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('3388e22a38b0add5d76a11d9e8a803c218c67baf2332ed436c6c16bde160af37')

build() {
	cd "${srcdir}"/${_pipname}-${pkgver}
	ls -la
	python setup.py build
}

package() {
	echo "https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz"
	cd "${srcdir}"/${_pipname}-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
