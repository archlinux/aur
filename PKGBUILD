# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name
pkgver=0.13.4
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
sha256sums=('264a9895b06fc609ec3e0de034a806466df1088d6200db85ced5386b365ee64c')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
