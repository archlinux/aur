# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

_name='dasbus'
pkgname="python-${_name}"
pkgver=1.6
pkgrel=1
pkgdesc='DBus library in Python 3'
arch=('any')
url="https://github.com/rhinstaller/dasbus"
license=('LGPL')
depends=('python' 'python-gobject' 'dbus')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('710617b229a9017b2d38b310b76fbac1a29976089cb8bfe4c01547dddb35d59e')

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
