# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
pkgname=zbase32
pkgver=1.1.5
pkgrel=2
pkgdesc="An alternate base32 encoder (not RFC 3548 compliant)"
arch=('any')
url='https://pypi.python.org/pypi/zbase32'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/z/zbase32/zbase32-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('9b25c34ba586cbbad4517af516e723599a6f38fc560f4797855a5f3051e6422f'
            'c341afeb154cdcf20c247c8289fadd82245c89d0ea40b630c98885481c29845f')

build() {
    cd "$srcdir/zbase32-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/zbase32-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
