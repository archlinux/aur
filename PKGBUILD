# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-djlint
_pkg="${pkgname#python-}"
pkgver=1.19.12
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
	'python-pathspec'
	'python-regex'
	'python-tomli'
	'python-tqdm'
	'python-yaml')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('048e9f8d43918b561f31bb49e2d52e6268bc88aa8d1c929c7416de2a575f6eff')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
