# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pebble
_name=${pkgname#python-}
pkgver=4.5.3
pkgrel=1
pkgdesc="Pebble provides a neat API to manage threads and processes within an application"
arch=('any')
url="https://mne.tools/stable/index.html"
license=('LGPL')
groups=()
depends=('python')
makedepends=()
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
sha1sums=('e8fecfca77a4192faec51748bbc46a644b25d3eb')

build() {
    cd "$srcdir/${_name^}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_name^}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
