# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=python-pikepdf
pkgver=0.3.1
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=('x86_64')
url='https://github.com/pikepdf/pikepdf'
license=(MPL)
makedepends=('pybind11<3,>=2.2.3')
depends=('python>=3.5'
         'qpdf>=8.1.0'
)
source=('https://files.pythonhosted.org/packages/cd/e8/1de3832c09826b50babefe0d833e452bb2caee61800b047d1094f9fde5ec/pikepdf-0.3.1.tar.gz')
sha256sums=('7cdf0a874de395c8cf00c92605a7c55445bbf41df9f0aae7c4d1625b66c4be26')

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
