# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name
pkgver=0.12.4
pkgrel=1
pkgdesc='CSV Tables in Markdown: Pandoc Filter for CSV Tables'
arch=('any')
url="https://github.com/ickc/$_name"
license=('GPL3')
_py_deps=('panflute<2'
          'yaml')
depends=('pandoc<2.10.0' 'python' "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e4a3a9bfb3c81c198f1157099c8d7bc62cd7e9139c2dc7d3fcac77534c7be2fa')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
