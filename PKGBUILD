# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-tableone
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="Create \"Table 1\" for research papers in Python"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python' 'python-tabulate' 'python-pandas' 'python-numpy' 'python-scipy' 'python-statsmodels')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6ba04e8337eb4e117109df317878486b865a153c6b293bca5ca6ce2f046b48e3')

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
