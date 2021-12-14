# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pantable
pkgname=python-$_name
pkgver=0.14.0
pkgrel=2
pkgdesc='CSV Tables in Markdown: Pandoc Filter for CSV Tables'
arch=(any)
url="https://github.com/ickc/$_name"
license=(GPL3)
_py_deps=('panflute>=2'
          yaml)
depends=('pandoc>=2.11.2'
         python
         "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools)
_archive="$_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_archive.tar.gz")
sha256sums=('6705702829320f0cd6a9d23e314c797b4309594a4d36ae6d456cfdf68b310d5f')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
