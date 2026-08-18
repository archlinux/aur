pkgname='python-pptree'
_name='pptree'
pkgver=3.1
pkgrel=1
pkgdesc='Pretty print trees'
url="https://github.com/clemtoy/${_name}"
makedepends=('python')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4dd0ba2f58000cbd29d68a5b64bac29bcb5a663642f79404877c0059668a69f6')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
