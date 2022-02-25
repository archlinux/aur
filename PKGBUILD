_pipname=yamk
pkgname="python-${_pipname}"
pkgver=2.1.0
pkgrel=1
pkgdesc="Yet another make"
arch=('any')
url="https://github.com/spapanik/yamk"
license=('MIT')
depends=('python-tomlkit')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('0ef2766dfa3fb23dd940d789a70dcb911c724af4db363170128bada5caa8147a')

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
