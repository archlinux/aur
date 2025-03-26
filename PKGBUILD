# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-folium
_pkgname=folium
pkgver=0.19.5
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps"
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
#checkdepends=('chromedriver' 'python-branca' 'python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca' 'python-requests' 'python-selenium' 'python-jenkspy' 'python-xyzservices')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/0b/4e/\
f5ef1fcacaa669465cc2ee0c71718f2093e89ec4086125fc5f3d335ed62f/folium-0.19.5.tar.gz")

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
md5sums=('59ad85e99f563495bf2e43d0e0552c02')
sha256sums=('103ef92d7738b91972f4531211f76eee3f38c88be03111bbd6a5e65c69d084df')
