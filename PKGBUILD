# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=python-pikepdf
pkgver=0.3.3
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=('x86_64')
url='https://github.com/pikepdf/pikepdf'
license=(MPL)
makedepends=('pybind11')
depends=('python' 'qpdf')
source=('https://files.pythonhosted.org/packages/84/8f/224ff7bd1f73c19998bb716dfbd0542b5c0362c72d11182be4a29d469d0d/pikepdf-0.3.3.tar.gz')
sha256sums=('6ccec26034149cc30d377918bb3be007a0798e6e46b2d98aed849279cab04fee')

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
