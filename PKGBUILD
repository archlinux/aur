# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-folium
_pkgname=folium
pkgver=0.16.0
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
#checkdepends=('chromedriver' 'python-branca' 'python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca' 'python-requests' 'python-selenium' 'python-jenkspy' 'python-xyzservices')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/fc/18/\
8b215f4c4a6f6c90837a3eface280f883b788c1515e6d61b19e9dfaf6e45/folium-0.16.0.tar.gz")

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
md5sums=('159ecefddadbe92e144dfd583c51a4d8')
sha256sums=('2585ee9253dc758d3a365534caa6fb5fa0c244646db4dc5819afc67bbd4daabb')
