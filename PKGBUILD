# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-webio-jupyter-extension'
_name=webio_jupyter_extension
pkgver='0.1.0'
pkgrel=2
pkgdesc="A JupyterLab extension to support Julia's WebIO package."
url="https://pypi.org/project/${_name}/"
depends=('jupyter-server')
makedepends=('python-setuptools' 'python-jupyter-packaging')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9b41496b86dd0b5734d99f98785ba68cf4b3cd75ae5c704b97bbacbf198ed2b7')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
