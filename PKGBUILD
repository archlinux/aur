# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.10.1
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
checkdepends=('python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-visualization/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3174afd7da70569d7868513e76c8300e29356b1c129eba3c88fec37e6642f3b7')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH=. pytest
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
