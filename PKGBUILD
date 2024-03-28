# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=python-sioyek
_name=${pkgname#python-}
pkgver=0.31.11
pkgrel=2
pkgdesc="Python wrapper and simple addons for sioyek PDF viewer"
arch=('any')
url="https://github.com/ahrm/sioyek-python-extensions"
license=('GPL')
depends=('sioyek' 'python-regex' 'python-pyperclip' 'python-appdirs' 'python-pypdf' 'python-pymupdf')
makedepends=('python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('f9d2f8549a20449b4d37e905eccaaa0e563bf33a0c9cc55529a79a8c4e83ccf9')

package() {
	cd "$srcdir"
	python -m installer --destdir="$pkgdir" *.whl
}
