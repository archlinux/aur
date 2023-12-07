# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-folium
_pkgname=folium
pkgver=0.15.1
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
#checkdepends=('chromedriver' 'python-branca' 'python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca' 'python-requests' 'python-selenium' 'python-jenkspy' 'python-xyzservices')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/04/4a/\
58cd7c0860d5adc10e7d0f1c04d7b89b3513c2606a2362ce44d897764102/folium-0.15.1.tar.gz")

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
md5sums=('5a53cadf452e1876cec9042d38304344')
sha256sums=('cb792d11e8049a455d3dc6416cdd8e7a1623d6b949f6e42c45a5d8fa4d1e24f4')
