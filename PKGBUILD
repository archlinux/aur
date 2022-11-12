pkgname=toot
_name=toot
pkgver=0.28.1
pkgrel=1
pkgdesc="a Mastodon CLI client"
makedepends=('python-setuptools')
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth' 'python-urwid')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://github.com/ihabunek/${_name}/archive/${pkgver}.zip)
sha256sums=('1bfeac1f2221aecd8154d42ad2e013efc76b78be63ee77c4daeb8dc700d29020')

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
