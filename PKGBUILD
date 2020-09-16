# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.11.0
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
checkdepends=('python-pillow' 'python-pytest' 'python-selenium')
depends=('python-jinja' 'python-branca')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-visualization/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5b32ffb900b6d09a0b3e23d44bfda39c6f84b63a447b0700eb01725cb6a5f0bd')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH=. pytest
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
