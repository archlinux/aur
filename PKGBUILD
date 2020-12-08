# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufolint
pkgver=1.2.0
pkgrel=1
pkgdesc='UFO source file linter'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
_py_deps=('commandlines'
          'fonttools>=4.18.0'
          'fs') # optdepends of fonttols required for [ufo])
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7fb1aeeca0c0038dc75e86688d5ee72b8fff34338676090cf6373405fe31abfc')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
