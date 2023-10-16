# Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

_name=pyradios
pkgname=python-$_name
pkgver=1.0.2
pkgrel=1
pkgdesc="Python client for the Radio Browser API."
arch=('any')
url="https://github.com/andreztz/pyradios"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andreztz/pyradios/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('ed512d3607f29b5568534b12e1d2035c')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    rm -rf $pkgdir/usr/lib/python3.11/site-packages/tests
}

