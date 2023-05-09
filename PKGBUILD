# Maintainer: éclairevoyant

_pkgname=sphinx-intl
pkgname="python-$_pkgname"
pkgver=2.1.0
pkgrel=1
pkgdesc='Sphinx utility to facilitate creating/applying translations'
arch=(any)
url="https://pypi.org/project/$_pkgname"
license=(BSD)
depends=(python-click python-importlib-metadata python-setuptools)
makedepends=(python-babel python-click)
optdepends=('transifex-client: for using transifex')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sphinx-doc/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
b2sums=('2b2a8b2f0f2f381d563d69e1250d713604ae73ed9c4be1ac8f04674ef23b54817e4516d18e82390a9c538c362bfe26f2318e37048d90f68a05c65d85c44004bd')

build() {
	cd $_pkgname-$pkgver
	python setup.py build
}

package_python-sphinx-intl() {
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
