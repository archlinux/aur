# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.5.0
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps."
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
checkdepends=('python-pytest')
depends=('python' 'python-jinja' 'python-branca')
options=(!emptydirs)
source=("https://github.com/python-visualization/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bed16ea86e583fcd6103851d5966713a9c27bdf8b49af52d24a2c5de8cb563c2')

#check() {
    #cd "$srcdir/$_pkgname-$pkgver"
    #PYTHONPATH=. pytest
#}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
