# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-tableone
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="Create \"Table 1\" for research papers in Python"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python' 'python-tabulate' 'python-pandas' 'python-numpy' 'python-scipy' 'python-statsmodels' 'python-jinja')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('85472ec914c8c3248de803aa42c71f595a305a65595936bc87b7ce5a7ce87da1')

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
