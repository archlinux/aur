# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-strictdoc'
_name=${pkgname#python-}
pkgver='0.0.33'
pkgrel=1
pkgdesc="Software for writing technical requirements and specifications."
url="https://github.com/strictdoc-project/strictdoc"
depends=(
	'python-datauri'
	'python-docutils'
	'python-fastapi'
	'python-hatchling'
	'python-pybtex'
	'python-pygments'
	'python-reqif'
	'python-textx'
	'python-xlrd'
	'python-xlsxwriter'
	'uvicorn'
)
makedepends=('python-pipreqs' 'python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('296e3628ae68f130164f472b160af37a02763144eb577fc0bb26bdc9d952e3b2')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}


