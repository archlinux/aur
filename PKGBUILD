# Maintainer: Bao Trinh <qubidt at gmail dot com>

_name=jupyter
pkgname=python-jupyter
pkgver=1.0.0
pkgrel=1
pkgdesc='Jupyter metapackage. Install all the Jupyter components in one go'
arch=('any')
url=http://jupyter.org/
license=('BSD')
depends=(
	'jupyter-notebook'
	'python-qtconsole'
	'jupyter_console'
	'jupyter-nbconvert'
	'python-ipykernel'
	'python-ipywidgets'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('1f0bc83f7a127c98ccf4b3868814116aa272ea5d0baac52d7a022305af7e2da28ca2b90fa3554ff085d8df3eb6d8b8cde80bf02b8e66064c59900b926d73c520')

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --optimize=1 --root="$pkgdir" --skip-build
}
