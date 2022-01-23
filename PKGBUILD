# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Joaquin Garmendia <joaquingc123 at gmail dot com>
# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=python-binarytree
pkgver=6.3.0
pkgrel=1
pkgdesc="Python library for studying binary trees"
arch=('any')
url="https://github.com/joowani/binarytree"
license=('MIT')
depends=('python-graphviz' 'python-setuptools')
makedepends=('python-setuptools-scm')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/binarytree/binarytree-$pkgver.tar.gz")
sha256sums=('e6c10746630b097dfd891d2e1fae7514f086257fd05d1b7b939caf854501497b')

build() {
	cd "binarytree-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "binarytree-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
