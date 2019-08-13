# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.sagan
pkgname=python-ripe-atlas-sagan
pkgver=1.3.0
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
sha256sums=('0a1d7548032a7521fcde6db6a766a5e01b06968d21691f9c89076561b8416222')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -rf "ripe/__pycache__" "ripe/atlas/__pycache__"
}
