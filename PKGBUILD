pkgname=python-brother_ql
pkgver=1.3
pkgrel=2
pkgdesc="Python package for the raster language protocol of the Brother QL series label printers"
url="https://github.com/matmair/brother_ql-inventree"
depends=('python' 'python-attrs' 'python-click' 'python-packbits' 'python-pillow>=3.3.0')
optdepends=('python-pyusb')
makedepends=('python-setuptools')
license=('GPL-3.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/b/brother_ql-inventree/brother_ql_inventree-$pkgver.tar.gz")
sha256sums=('24335ca5f4b3444c692698b599459a7e6c4bd036dd580074c63d39382914fca3')

build() {
    cd "$srcdir/brother_ql_inventree-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/brother_ql_inventree-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
