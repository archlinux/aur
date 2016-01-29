# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.cousteau
pkgname=python-ripe-atlas-cousteau
pkgver=1.0.7
pkgrel=1
pkgdesc="A python wrapper around RIPE ATLAS API"
arch=('any')
url="https://pypi.python.org/pypi/ripe.atlas.cousteau"
license=('GPL3')
depends=('python>=3.4' 'python-requests>=2.7.0' 'python-dateutil' 'python-socketio-client>=0.6.5')
makedepends=('python-setuptools')
provides=('python-ripe-atlas-cousteau')
source=("https://pypi.python.org/packages/source/r/$_name/$_name-$pkgver.tar.gz")
md5sums=('a10d16cb42f463b2d949a8516acd3c3d')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -rf "ripe/__pycache__" "ripe/atlas/__pycache__"
}
