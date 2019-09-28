# Maintainer: Duncan X Simpson <duncan@k7dxs.net>

pkgname=python-deadsimplekv
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple key-value store with caching for Python"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/beardog108/deadsimplekv"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/2f/3e/183d7f11d2fda4c5fb3f3cfd5a13452e1de499f5666b9345750d9325201a/deadsimplekv-0.2.0.tar.gz")
md5sums=('a1975f53658fd53af1522f0e84cccd8e')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"

    msg2 'Building...'
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"

    msg2 'Installing...'
    python setup.py install --root="$pkgdir" --optimize=1
}
