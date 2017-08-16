# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.3.0
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps."
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
checkdepends=('python-nose')
depends=('python' 'python-jinja' 'python-branca')
options=(!emptydirs)
source=("https://github.com/python-visualization/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('317cbb1d73a8b241b50bf01c0db1a7004742bded2336577bc8b619280875590f')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    nosetests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
