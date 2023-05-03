# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-jupyterlab-spellchecker'
_name=${pkgname#python-}
pkgver='0.7.3'
pkgrel=1
pkgdesc="A spell checker for JupyterLab."
url="https://pypi.org/project/${_name}/"
depends=('jupyter-server')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('5b862228479b33b95b9d4eb47482b4a11c6732efb2c8c8123c7f88efc3695e76')

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
