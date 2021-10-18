# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fpdf2
_name=${pkgname#python-}
pkgver=2.4.5
pkgrel=1
pkgdesc='Simple PDF generation for Python'
arch=(any)
url='https://pyfpdf.github.io/fpdf2/'
license=(LGPL3)
conflicts=('python-fpdf')
depends=('python' 'python-pillow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e20a318ec214ef9620ec90a3eb6a5c6ac5acf7bacf4ee495699de9cb7d0d12d7')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
