# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pebble
_name=${pkgname#python-}
pkgver=5.2.2
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
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name}-$pkgver.tar.gz)
noextract=()
sha256sums=('eb49a0f6862f7e75df4a40107f1c8c267cf8adfbd6d29a0dac29d17ac188c878')

build() {
    cd "$srcdir/${_name}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
