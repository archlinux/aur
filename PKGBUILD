# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Riccardo Berto <riccardo at rcrdbrt dot com>

pkgname=python-expense_manager
_pkg="${pkgname#python-}"
pkgver=0.2.5
pkgrel=2
pkgdesc="Command-line expense manager and bank account logger"
arch=('any')
url="https://github.com/RcrdBrt/expense_manager"
license=('custom:unknown')
depends=('python-dataset' 'python-cmd2' 'python-colorama' 'python-termcolor' 'python-tabulate')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2f0153e47f7d481a26a22cee3002f61adc32fde695d0160045843654b198b94f')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
