# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=python-pikepdf
pkgver=0.3.5
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=('x86_64')
url='https://github.com/pikepdf/pikepdf'
license=(MPL)
makedepends=('pybind11')
depends=('python' 'qpdf')
source=('https://files.pythonhosted.org/packages/09/ef/db0bc644097f52382f8040633ca8bc49b04a54dfbf76147c495398e2949b/pikepdf-0.3.5.tar.gz')
sha256sums=('661d38fd54bf419549bb162b9dab6699395896a52e10ca5d0b52610806122d69')

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
