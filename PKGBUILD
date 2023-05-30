# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-strictdoc'
_name=${pkgname#python-}
pkgver='0.0.41'
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
sha256sums=('b1d06dcb2196b5c2c135bcf976d00f68c1c398e278459da10961a0745158ecb5')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}


