# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=python-pikepdf
pkgver=1.1.0
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=('x86_64')
url='https://github.com/pikepdf/pikepdf'
license=(MPL2)
makedepends=('pybind11' 'python-setuptools')
depends=('python' 'qpdf')
source=('https://files.pythonhosted.org/packages/d0/de/87be0b2b9dd5626d87df75f7f5ee04276cde661095eb4f854193eeaa32c4/pikepdf-1.1.0.tar.gz')
sha256sums=('be826ba57db1a928ca0b95d7513e1c45cb7042ddf88adbb5f80881014d366391')

build() {
        cd "$srcdir/pikepdf-${pkgver}"
        /usr/bin/python setup.py build
}

package() {
        cd "$srcdir/pikepdf-${pkgver}"
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        install -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
        /usr/bin/python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
