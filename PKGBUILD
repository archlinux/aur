# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fpdf2
_name=${pkgname#python-}
pkgver=2.5.0
pkgrel=1
pkgdesc='Simple PDF generation for Python'
arch=(any)
url='https://pyfpdf.github.io/fpdf2/'
license=(LGPL3)
conflicts=('python-fpdf')
depends=('python' 'python-pillow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a171cfd49d71fb43f038341225e3506fa6bf42a133e21c44a0612e527879ad67')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
