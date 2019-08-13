# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.cousteau
pkgname=python-ripe-atlas-cousteau
pkgver=1.4.2
pkgrel=1
pkgdesc="A python wrapper around RIPE ATLAS API"
arch=('any')
url="https://pypi.python.org/pypi/$_name"
license=('GPL3')
depends=('python>=3.4' 'python-requests>=2.7.0' 'python-dateutil' 'python-socketio-client>=0.6.5')
makedepends=('python-setuptools')
provides=('python-ripe-atlas-cousteau')
source=("https://pypi.io/packages/source/r/$_name/$_name-$pkgver.tar.gz")
sha256sums=('10b930ff67c9744f6ee275e07a441a8fba1911f251e92c0ca511b8c082a3fcd5')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -rf "ripe/__pycache__" "ripe/atlas/__pycache__"
}
