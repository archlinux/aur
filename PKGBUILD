# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.tools
pkgname=ripe-atlas-tools
pkgver=2.0.2
pkgrel=1
pkgdesc="The official command-line client for RIPE Atlas"
arch=('any')
url="https://pypi.python.org/pypi/$_name"
license=('GPL3')
optdepends=('python-ujson: faster json decoding' 'python-sphinx: documentation generator')
depends=('python>=3.4' 'python-dateutil>=2.4.2' 'python-requests>=2.7.0' 'python-ripe-atlas-cousteau>=1.2' 'python-ripe-atlas-sagan>=1.1.10' 'python-tzlocal' 'python-yaml' 'python-pyopenssl>=0.13')
makedepends=('python-setuptools')
provides=('ripe-atlas-tools')
source=("https://pypi.io/packages/source/r/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a6a46fb85cb40f0f5644df3df5110cbdc0394b278f289cbe6462cbb10eda0d78')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -rf "ripe/__pycache__" "ripe/atlas/__pycache__"
}
