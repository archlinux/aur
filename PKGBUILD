# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-reorder-python-imports
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=2.6.0
pkgrel=2
pkgdesc="Automatically reorder Python imports."
url="https://github.com/asottile/reorder_python_imports"
depends=('python' 'python-aspy-refactor-imports')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$name/$_name-$pkgver.tar.gz")
sha256sums=('f4dc03142bdb57625e64299aea80e9055ce0f8b719f8f19c217a487c9fa9379e')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
