pkgname=toot
_name=toot
pkgver=0.29.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
makedepends=('python-setuptools')
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth' 'python-urwid')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://github.com/ihabunek/${_name}/archive/${pkgver}.zip)
sha256sums=('7aec26e51b89f76e4d89bc6a692877b993e8f7e954802c9d334752ed6d8815d8')

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
