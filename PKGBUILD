pkgname=toot
_name=toot
pkgver=0.30.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
makedepends=('python-setuptools')
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth' 'python-urwid')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://github.com/ihabunek/${_name}/archive/${pkgver}.zip)
sha256sums=('eb061cceacd80d48188c3e65b077b491eb9558dbc646a5257644d3e585c9942d')

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
