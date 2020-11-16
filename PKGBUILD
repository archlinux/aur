# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufolint
pkgver=1.0.3
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
sha256sums=('2351a2eecf33c7a61844e53b584f25c9f71a2a2c1475214b8fbcea8e0d4e1564')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
