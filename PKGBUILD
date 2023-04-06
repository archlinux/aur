# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fpdf2
_name=${pkgname#python-}
pkgver=2.7.3
pkgrel=1
pkgdesc='Simple PDF generation for Python'
arch=(any)
url='https://pyfpdf.github.io/fpdf2/'
license=(LGPL3)
conflicts=('python-fpdf')
depends=('python' 'python-pillow' 'python-defusedxml' 'python-fonttools')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5e53fd440b1b6dc24a33f5c12d05bc349f923a78f50e2ecb2f0b876b55182c41')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
