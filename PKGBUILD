# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-folium
_pkgname=folium
pkgver=0.14.0
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
#checkdepends=('chromedriver' 'python-branca' 'python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca' 'python-requests' 'python-selenium' 'python-jenkspy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/bb/d0/\
2d8d1a500d829caa0e6b394ee933344f7fee81cb685409e5aaf5c9492f64/folium-0.14.0.tar.gz")

build() {
	cd $srcdir/$_pkgname-$pkgver
	python setup.py build
}

#check() {
    #cd "$_pkgname-$pkgver"
    #PYTHONPATH=. pytest
#}

package() {
	cd $srcdir/$_pkgname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
md5sums=('98f698263ca331d98ea53d5f45770c90')
sha256sums=('8ec44697d18f5932e0fdaee8b19da98625de4d0e72cb30ef56f9479f18e11b9f')
