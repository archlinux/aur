# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.tools
pkgname=ripe-atlas-tools
pkgver=2.0.1
pkgrel=1
pkgdesc="The official command-line client for RIPE Atlas"
arch=('any')
url="https://pypi.python.org/pypi/$_name"
license=('GPL3')
optdepends=('python-ujson: faster json decoding' 'python-sphinx: documentation generator')
depends=('python>=3.4' 'python-dateutil>=2.4.2' 'python-requests>=2.7.0' 'python-ripe-atlas-cousteau>=1.2' 'python-ripe-atlas-sagan>=1.1.10' 'python-tzlocal' 'python-yaml' 'python-pyopenssl>=0.13')
makedepends=('python-setuptools')
provides=('ripe-atlas-tools')
#source=("https://pypi.python.org/packages/source/r/$_name/$_name-$pkgver.tar.gz")
source=("https://pypi.python.org/packages/96/01/c7f7b10d01d5d0d3ff8e9c91051791348cb1154891e6ec40377d0ddba0bf/ripe.atlas.tools-2.0.1.tar.gz")
md5sums=('b3c78853971a5bf110cfbc283c1e0e2c')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -rf "ripe/__pycache__" "ripe/atlas/__pycache__"
}
