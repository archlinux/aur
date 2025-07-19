# Maintainer: casperrr
pkgname=pytermpix
pkgver=1.0.5
pkgrel=1
pkgdesc="Convert and display images as pixel art in an ANSI terminal"
arch=('any')
url="https://github.com/casperrr/termpix"
license=('MIT')
depends=('python' 'python-pillow' 'python-requests' 'python-validators')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

build() {
    cd "$startdir"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$startdir"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
}