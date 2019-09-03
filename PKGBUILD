pkgname=toot
_name=toot
pkgver=0.23.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('e2dcd2e1d021463cf96779e0cdb5fd46c0115d0bd0645677ab1af531574a2eb4')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
