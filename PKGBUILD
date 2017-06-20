# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.sagan
pkgname=python-ripe-atlas-sagan
pkgver=1.2
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
sha256sums=('52bf9f7d0a5a82535f629a2af5644e8de1c4b085f711841ca3660d34fbef19cc')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -rf "ripe/__pycache__" "ripe/atlas/__pycache__"
}
