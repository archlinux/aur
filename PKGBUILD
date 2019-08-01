pkgname=toot
_name=toot
pkgver=0.22.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('dcf36bd9ff56fe1d13162da97e54b6ddfc20d50f1c1f276f8ed51b26cdc7fbb6')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
