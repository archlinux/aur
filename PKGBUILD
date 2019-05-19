# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=python-pikepdf
pkgver=1.3.0
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=('x86_64')
url='https://github.com/pikepdf/pikepdf'
license=(MPL2)
makedepends=('pybind11' 'python-setuptools')
depends=('python' 'qpdf')
source=('https://files.pythonhosted.org/packages/04/a0/0951cda6ebdf3d205af9b177250382e3c149a96b82d0ce75e984310488e1/pikepdf-1.3.0.tar.gz')
sha256sums=('f6db680c47e01ab23ee813d7c0e2bc50469a6a9f4a33414e961d07cdec0ed541')

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
