# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.sagan
pkgname=python-ripe-atlas-sagan
pkgver=1.1.8
pkgrel=1
pkgdesc="A parsing library for RIPE Atlas measurement results"
arch=('any')
url="https://github.com/RIPE-NCC/$_name"
license=('GPL3')
depends=('python>=3.4' 'python-dateutil' 'python-pytz' 'python-ipy' 'python-pyopenssl')
optdepends=('python-ujson: faster json decoding' 'python-sphinx: documentation generator')
makedepends=('python-setuptools')
provides=('python-ripe-atlas-sagan')
source=("https://pypi.python.org/packages/source/r/$_name/$_name-$pkgver.tar.gz")
md5sums=('6a29ebba5926afc4d8791fc48993eae5')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -r "ripe/__pycache__" "ripe/atlas/__pycache__"
}
