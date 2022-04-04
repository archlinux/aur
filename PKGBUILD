# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.12.1.post1
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
#checkdepends=('chromedriver' 'python-branca' 'python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e91e57d8298f3ccf4cce3c5e065bea6eb17033e3c5432b8a22214009c266b2ab')

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
