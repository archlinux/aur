# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python2-flanker
pkgver=0.9.11
pkgrel=1
_libname=flanker
pkgdesc='Mailgun Parsing Tools'
url='https://pypi.python.org/pypi/flanker'
depends=('python2')
optdepends=('python2-regex: for flanker.mime'
            'python2-paste: for flanker.mime'
            'python2-redis: for flanker.mime'
            'python2-dnsq: for flanker.mime')
license=('Apache2')
arch=('any')
source=(https://files.pythonhosted.org/packages/a6/44/a2d77a6f2ad4d78912b549a97b915f43da3cc9e6dbfc2084520bdaa6d00e/flanker-${pkgver}.tar.gz)

build() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py install --root="$pkgdir"
}

sha256sums=('974418e5b498fd3bcb3859c22e22d26495257f9cf98b744c17f2335aca86e001')
