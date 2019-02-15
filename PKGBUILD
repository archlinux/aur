pkgname=toot
_name=toot
pkgver=0.21.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
depends=('python-requests' 'python-beautifulsoup4' 'python-wcwidth')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('3de89f7b3abed0ef73163ce3114a3fc259b7f8f37168eb6c3b797035992c1bb7')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
