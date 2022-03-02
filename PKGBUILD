# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-reorder-python-imports
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=2.7.1
pkgrel=1
pkgdesc="Automatically reorder Python imports."
url="https://github.com/asottile/reorder_python_imports"
depends=('python' 'python-aspy-refactor-imports')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1ae34422f13f5a4b4669f340774909d721bfc0a8311973c70b3a50540b595bc5')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
