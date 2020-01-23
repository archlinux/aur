pkgname=toot
_name=toot
pkgver=0.25.2
pkgrel=1
pkgdesc="a Mastodon CLI client"
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth' 'python-urwid')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('78138c6b7fef1bd150942bb5b5567359e3a498aed0b8b732cea264f74fa35399')

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
