pkgname=toot
_name=toot
pkgver=0.31.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
makedepends=('python-setuptools')
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth' 'python-urwid')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://github.com/ihabunek/${_name}/archive/${pkgver}.zip)
sha256sums=('31a01b1119d095ff4ee494239da5a04a8309f1d6a87ba603f59e339e7344f312')

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
