_pipname=yamk
pkgname="python-${_pipname}"
pkgver=1.3.0
pkgrel=1
pkgdesc="Yet another make"
arch=('any')
url="https://github.com/spapanik/yamk"
license=('MIT')
depends=('python-tomlkit')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha512sums=('3f66e77b579ba3507a11b3e1dd4cded9c14943154d1fa30925134d20c26bcb085d48025f1ca6a44e02a73e1100abc0547dd93b4971760d57daf8236b03c741d0')

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
