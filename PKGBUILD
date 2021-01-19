# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib
_name=pycdlib
pkgver=1.11.0
pkgrel=1
pkgdesc='Python library to read and write ISOs'
arch=('any')
url=https://github.com/clalancette/pycdlib
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5020fa72d0a47457d54032125215ac120e3ab68e3a2c81fdc7a2705ce2a8f2e17458e144081218c4e103a0d346416cf46d70a6c56e1111f257e8b0602bace1dc')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
