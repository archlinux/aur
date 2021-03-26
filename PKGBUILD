# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyperglot
pkgver=0.2.9
pkgrel=1
pkgdesc='Hyperglot: a database and tools for detecting language support in fonts'
arch=(any)
url="https://github.com/rosettatype/$pkgname"
license=('GPL3')
_py_deps=(click fonttools yaml unicodedata2 colorlog)
depends=(python ${_py_deps[@]/#/python-})
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0dc1795f275c11a112a2da01c1b9f50d22f9c58439732738cfbb74679e7e4db9')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
