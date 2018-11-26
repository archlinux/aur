# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=python-pikepdf
pkgver=0.3.7
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=('x86_64')
url='https://github.com/pikepdf/pikepdf'
license=(MPL)
makedepends=('pybind11')
depends=('python' 'qpdf')
source=('https://files.pythonhosted.org/packages/e7/d9/67b6b5c93bc72f1e87a0aa21f1b7cf13f5831c09ffcd829a3fbc8402f179/pikepdf-0.3.7.post2.tar.gz')
sha256sums=('7afb12bca02118ca3e20c7fa7baa0c01fdd0148fb9aa2c6ee350f37fcebb7fbf')

build() {
        cd "$srcdir/pikepdf-${pkgver}.post2"
        /usr/bin/python setup.py build
}

package() {
        cd "$srcdir/pikepdf-${pkgver}.post2"
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        install -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
        /usr/bin/python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
