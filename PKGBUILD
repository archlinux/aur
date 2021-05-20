# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name
pkgver=0.13.6
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
sha256sums=('f0b8e5177c57f4a7c9ecba8b27816ebf61774061c8606eb67bca83f94c5a3608')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
