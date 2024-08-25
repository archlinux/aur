# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-folium
_pkgname=folium
pkgver=0.17.0
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
#checkdepends=('chromedriver' 'python-branca' 'python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca' 'python-requests' 'python-selenium' 'python-jenkspy' 'python-xyzservices')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/73/25/\
a11f642a63d1c9653e12b4bac27a147bb91bf97609881161723fa803bb01/folium-0.17.0.tar.gz")

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
md5sums=('11b72e4c6588cdb790a15505fad2e59e')
sha256sums=('48385df9a3f6ceca23647c2e8d87850c8a6e05b40db63266e7b8c6d2d734d4c6')
