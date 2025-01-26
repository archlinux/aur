# Maintainer: Dringsim <dringsim@qq.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-djlint
_pkg="${pkgname#python-}"
pkgver=1.36.4
pkgrel=1
pkgdesc='HTML Template Linter and Formatter'
arch=('any')
url='https://github.com/djlint/djLint/releases/tag/v1.34.1'
license=('GPL3')
depends=(
	'python-click'
	'python-colorama'
	'python-cssbeautifier'
	'python-jsbeautifier'
	'python-json5'
	'python-pathspec'
	'python-regex'
	'python-tomli'
	'python-tqdm'
	'python-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('17254f218b46fe5a714b224c85074c099bcb74e3b2e1f15c2ddc2cf415a408a1')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
