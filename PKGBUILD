# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-tableone
_name=${pkgname#python-}
pkgver=0.7.2
pkgrel=1
pkgdesc="Create \"Table 1\" for research papers in Python"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python' 'python-tabulate' 'python-pandas' 'python-numpy' 'python-scipy' 'python-statsmodels')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('37496b4433d89175ec2f000ede2922990209065e26168389654d24be5a2c8e71')

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
