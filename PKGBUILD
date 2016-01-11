# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-ntplib
_pkgname=${pkgname/python-/}
pkgver=0.3.3
pkgrel=1
pkgdesc="Simple interface to query NTP servers from Python"
url="https://code.google.com/p/ntplib/"
depends=('python')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/n/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c4621b64d50be9461d9bd9a71ba0b4af06fbbf818bbd483752d95c1a4e273ede')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

