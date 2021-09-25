# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>

pkgname=python-pylatex
pkgver=1.4.1
pkgrel=1
pkgdesc='Python library for creating LaTeX files'
arch=('any')
url='https://jeltef.github.io/PyLaTeX/'
license=('MIT')
depends=('python-ordered-set')
optdepends=('python-numpy' 'python-matplotlib' 'python-quantities' 'texlive-core')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeltef/pylatex/archive/v$pkgver.tar.gz")
sha256sums=('79f1c94ed7c251378d1a4008635b3123191dbe65bac79c9aaeb0eaefbdfcf13c')

build() {
	cd "PyLaTeX-$pkgver"
	python setup.py build
}

# check() {
# 	cd "PyLaTeX-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "PyLaTeX-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
