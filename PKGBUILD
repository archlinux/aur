# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.12.1
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
checkdepends=('chromedriver' 'python-branca' 'python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-visualization/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3e0cb5bc1817db67ff216af3875a45b50b453c1ae9adf5c4b610413a91b3e1cc')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

#check() {
    #cd "$_pkgname-$pkgver"
    #PYTHONPATH=. pytest
#}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
