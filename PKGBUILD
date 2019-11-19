pkgname=python-brother_ql
pkgver=0.9.4
pkgrel=2
pkgdesc="Python package for the raster language protocol of the Brother QL series label printers"
url="https://github.com/pklaus/brother_ql"
depends=('python' 'python-attrs' 'python-click' 'python-future' 'python-packbits' 'python-pillow>=3.3.0')
optdepends=('python-pyusb')
makedepends=('python-setuptools')
license=('GPL-3.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/b/brother_ql/brother_ql-$pkgver.tar.gz")
sha256sums=('1f5c57a039f012c9c204397f470001f76ebb7483421ebde985d0cb3c614e8660')

build() {
    cd "$srcdir/brother_ql-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/brother_ql-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
