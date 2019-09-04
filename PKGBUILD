pkgname=toot
_name=toot
pkgver=0.23.1
pkgrel=2
pkgdesc="a Mastodon CLI client"
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth' 'python-urwid')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('3ff1c31923f51c63d6eafd07184cee7358315a3c1b0f85e5a148574edc23d5fa')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
