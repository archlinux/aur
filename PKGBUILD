# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-ntplib
_pkgname=${pkgname/python-/}
pkgver=0.3.4
pkgrel=1
pkgdesc="Simple interface to query NTP servers from Python"
url="https://github.com/cf-natali/ntplib"
depends=('python')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/cf-natali/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e822d7142b84d72022b9caaf00f6d2a7541f9822f41e1c133839db1d7957abbe')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

