# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

_name='dasbus'
pkgname="python-${_name}"
pkgver=1.7
pkgrel=1
pkgdesc='DBus library in Python 3'
arch=('any')
url="https://github.com/rhinstaller/dasbus"
license=('LGPL')
depends=('python' 'python-gobject' 'dbus')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('442a8df9330d4f55704c92cbed066cf0918378418be89d6fff67721d3cba5590')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

check() {
    cd "$_name-$pkgver"
    pytest
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=4 sw=4 et:
