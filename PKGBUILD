# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=python-pikepdf
pkgver=1.0.5
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=('x86_64')
url='https://github.com/pikepdf/pikepdf'
license=(MPL2)
makedepends=('pybind11' 'python-setuptools')
depends=('python' 'qpdf')
source=('https://files.pythonhosted.org/packages/11/dd/b2740a6ebde6822e8bef1902b659e785b7a91630493ad217f1e76130b3c6/pikepdf-1.0.5.tar.gz')
sha256sums=('b878dda8618939b8dda61418f193904c720aaa606167906e33d6e21c5cb531e1')

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
