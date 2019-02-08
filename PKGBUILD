# Maintainer: Alexander Seiler <seileralex@gmail.com>

pkgname=python-halo
_name=${pkgname#python-}
pkgver=0.0.23
pkgrel=1
pkgdesc="Beautiful terminal spinners in Python"
arch=('any')
url="https://github.com/manrajgrover/${_name}"
license=('MIT')
depends=('python' 'python-log_symbols' 'python-spinners' 'python-cursor' 'python-termcolor' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3e5b9fa098cfe331bc324674b44b6b03af181ef9518c092e6405a4eda6f9d59d')

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
