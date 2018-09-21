# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.6.0
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps."
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
checkdepends=('python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca')
options=(!emptydirs)
source=("https://github.com/python-visualization/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('81862767f7eba25f9618c3cd17fa514d9b1d7470475ef985017b71a9e4a57367')

#check() {
    #cd "$srcdir/$_pkgname-$pkgver"
    #PYTHONPATH=. pytest
#}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
