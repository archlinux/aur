# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-sphinx-needs'
_name=sphinx_needs
pkgver='1.2.2'
pkgrel=1
pkgdesc="Sphinx needs extension for managing needs/requirements and specifications"
url="https://www.sphinx-needs.com/"
depends=(python-jsonschema python-matplotlib python-requests-file python-sphinx)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e00f286a6eaa7e8e5197b998a54b4ea09669a86fa4f968540ea50bce4bf752f6')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
