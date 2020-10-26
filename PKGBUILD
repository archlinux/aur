# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufolint
pkgver=1.0.2
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
sha256sums=('fd0aae8c3460a9bb3a94397d8857234574da1a34b8e929bd6e41777f5afbbed2')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
