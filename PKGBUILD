# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name
pkgver=0.13.1
pkgrel=1
pkgdesc='CSV Tables in Markdown: Pandoc Filter for CSV Tables'
arch=('any')
url="https://github.com/ickc/$_name"
license=('GPL3')
_py_deps=('panflute>=2'
          'yaml')
depends=('pandoc>=2.11.2'
         'python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3a8feaed6b892ba920442d68e4141994a32636588cf6e8f464d61cf90e4143c8')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
