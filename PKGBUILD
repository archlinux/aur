pkgname=toot
_name=toot
pkgver=0.36.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
makedepends=('python-setuptools')
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth' 'python-urwid')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://github.com/ihabunek/${_name}/archive/${pkgver}.zip)
sha256sums=('f7e22393180ded59b6e68ec4adaa77059923df5d4b02c3c8c8aa2b91f0fa8741')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    mkdir -p $pkgdir/usr/share/licenses/toot
    cp $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/toot/
}
