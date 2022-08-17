# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fpdf2
_name=${pkgname#python-}
pkgver=2.5.6
pkgrel=1
pkgdesc='Simple PDF generation for Python'
arch=(any)
url='https://pyfpdf.github.io/fpdf2/'
license=(LGPL3)
conflicts=('python-fpdf')
depends=('python' 'python-pillow' 'python-defusedxml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('47bb73efab9c7dfb35a91ce495fb4193574a38769adea95026fbd739963ba7a2')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
