# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-expiringdict
_name=expiringdict
pkgver=1.1.4
pkgrel=1
pkgdesc='Dictionary with auto-expiring values for caching purposes'
url='https://pypi.python.org/pypi/expiringdict'
depends=('python')
license=('APACHE')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('9275c3f3aa6cabe394355b6454100eb1cdfe395c6b592c26603a2a0f9e3a0587')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build
}
