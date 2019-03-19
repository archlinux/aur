# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-folium
_pkgname=folium
pkgver=0.8.3
pkgrel=1
pkgdesc="Python Data. Leaflet.js maps."
arch=('any')
url="https://github.com/python-visualization/folium"
license=('MIT')
checkdepends=('python-pillow' 'python-pytest' 'python-selenium')
depends=('python' 'python-jinja' 'python-branca')
options=(!emptydirs)
source=("https://github.com/python-visualization/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e8e531db7c0a6cab3fb7535dbedd416d4eed19596d7de1aa8fd2c2b8bacb8807')

#check() {
    #cd "$srcdir/$_pkgname-$pkgver"
    #PYTHONPATH=. pytest
#}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
