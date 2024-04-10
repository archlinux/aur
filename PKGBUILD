# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pebble
_name=${pkgname#python-}
pkgver=5.0.7
pkgrel=1
pkgdesc="Pebble provides a neat API to manage threads and processes within an application"
arch=('any')
url="https://github.com/noxdafox/pebble"
license=('LGPL')
groups=()
depends=('python')
makedepends=('python-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name^}-$pkgver.tar.gz)
noextract=()
sha1sums=('0142bd51e3baa2d7afb6e0723f536d74c4d20bed')

build() {
    cd "$srcdir/${_name^}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_name^}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
