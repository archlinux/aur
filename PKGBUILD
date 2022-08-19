# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-tableone
_name=${pkgname#python-}
pkgver=0.7.11
pkgrel=1
pkgdesc="Create \"Table 1\" for research papers in Python"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python' 'python-tabulate' 'python-pandas' 'python-numpy' 'python-scipy' 'python-statsmodels')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2793c3a55d54f22ed0156b7e56f9d3edb07dd4d010ea002747a65df65a3eac11')

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
