# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.sagan
pkgname=python-ripe-atlas-sagan
pkgver=1.1.11
pkgrel=1
pkgdesc="A parsing library for RIPE Atlas measurement results"
arch=('any')
url="https://pypi.python.org/pypi/$_name"
license=('GPL3')
depends=('python>=3.4' 'python-dateutil' 'python-pytz' 'python-ipy' 'python-pyopenssl')
optdepends=('python-ujson: faster json decoding' 'python-sphinx: documentation generator')
makedepends=('python-setuptools')
provides=('python-ripe-atlas-sagan')
source=("https://pypi.io/packages/source/r/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b51c464b6ef4f2cca0621bb1c4a2c626b58afbe9c32c5292c6ab7c8c1b705d08')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -rf "ripe/__pycache__" "ripe/atlas/__pycache__"
}
