# Maintainer: Dringsim <dringsim@qq.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-djlint
_pkg="${pkgname#python-}"
pkgver=1.32.1
pkgrel=1
pkgdesc='HTML Template Linter and Formatter'
arch=('any')
url='https://github.com/Riverside-Healthcare/djlint'
license=('GPL3')
depends=(
	'python-click'
	'python-colorama'
	'python-cssbeautifier'
	'python-html-tag-names'
	'python-html-void-elements'
	'python-jsbeautifier'
	'python-json5'
	'python-pathspec'
	'python-regex'
	'python-tomli'
	'python-tqdm'
	'python-yaml')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('c1e2141acf1547d244af7ef8abd15fbbae2abcc7a03e2bf31f8a491de69a6c72')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
