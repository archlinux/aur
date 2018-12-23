# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=python-pikepdf
pkgver=0.9.2
pkgrel=1
pkgdesc='Read and write PDFs with Python, powered by qpdf'
arch=('x86_64')
url='https://github.com/pikepdf/pikepdf'
license=(MPL2)
makedepends=('pybind11' 'python-setuptools')
depends=('python' 'qpdf')
source=('https://files.pythonhosted.org/packages/24/0f/42fffdf649a795d7af21c0445b1880c6793ef86e0bfc0977b868a353dcef/pikepdf-0.9.2.tar.gz')
sha256sums=('4072a51195a4554882ef76d8f59d980a1f64062e8a7852442190b0f26ff5056c')

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
