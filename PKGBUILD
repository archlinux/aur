# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-mode
pkgver=4.4.0
pkgrel=1
pkgdesc="Python AsyncIO Services"
arch=('any')
url="https://github.com/ask/mode"
license=('BSD')
depends=('python-colorlog>=2.9.0' 'python-mypy_extensions')
makedepends=('python-setuptools')
# checkdepends=(
# 	'python-pytest'
# 	'python-pytest-runner'
# 	'python-pytest-aiofiles>=0.2.0'
# 	'python-pytest-asyncio>=0.8'
# 	# 'python-pytest-base-url>=1.4.1' ## NOT IN AUR
# 	'python-pytest-forked'
# 	'python-pytest-openfiles>=0.2.0' ## AUR
# 	# 'python-pytest-random-order>=0.5.4' ## NOT IN AUR
# 	'python-hypothesis>=3.31')
changelog=Changelog
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/mode/mode-$pkgver.tar.gz")
sha256sums=('2a73f1b8034f922d31b3827016cbddf3b64d01815eed9d6c31377ef82a11d9a6')

build() {
	cd "mode-$pkgver"
	python setup.py build
}

# check() {
# 	cd "mode-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "mode-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
