# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fpdf2
_name=${pkgname#python-}
pkgver=2.4.3
pkgrel=1
pkgdesc='Simple PDF generation for Python'
arch=(any)
url='https://pyfpdf.github.io/fpdf2/'
license=(LGPL3)
conflicts=('python-fpdf')
depends=('python' 'python-pillow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('453e81453244bca8cf90a150ed32136ec7d4c0bbc57010e7b082c9864de4d01b')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
