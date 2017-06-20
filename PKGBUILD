# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.cousteau
pkgname=python-ripe-atlas-cousteau
pkgver=1.4
pkgrel=1
pkgdesc="A python wrapper around RIPE ATLAS API"
arch=('any')
url="https://pypi.python.org/pypi/$_name"
license=('GPL3')
depends=('python>=3.4' 'python-requests>=2.7.0' 'python-dateutil' 'python-socketio-client>=0.6.5')
makedepends=('python-setuptools')
provides=('python-ripe-atlas-cousteau')
source=("https://pypi.io/packages/source/r/$_name/$_name-$pkgver.tar.gz")
sha256sums=('41e0c91ae4459a6c101448f5bafb043ba44b4abfd9a80a5ae0b4c3a1bb550a52')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -rf "ripe/__pycache__" "ripe/atlas/__pycache__"
}
