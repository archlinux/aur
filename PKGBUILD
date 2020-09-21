# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufolint
pkgver=1.0.1
pkgrel=1
pkgdesc='UFO source file linter'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
_py_deps=('commandlines'
          'fonttools'
          'fs') # optdepends of fonttols required for [ufo])
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('009aef40401ffe86c9665ee34936aa38422d0afe3817fdbaae19740acc73d3f0')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
