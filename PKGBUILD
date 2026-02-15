# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-reorder-python-imports
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=3.16.0
pkgrel=1
pkgdesc="Automatically reorder Python imports."
url="https://github.com/asottile/reorder_python_imports"
depends=('python' 'python-aspy-refactor-imports')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bcc4e5e467a8833ec187e35f84f1a3e442881b3c62c265ece87677100473db43')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
