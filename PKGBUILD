# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.7.0
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps."
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
checkdepends=('python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca')
options=(!emptydirs)
source=("https://github.com/python-visualization/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b65e55d1b9e1180da92e61ddf83e93717f222abbec2cd69e918880e8d04b56c5')

#check() {
    #cd "$srcdir/$_pkgname-$pkgver"
    #PYTHONPATH=. pytest
#}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
