pkgname=toot
_name=toot
pkgver=0.19.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('857adc08ed2531c934a69d64efc78cd96bca80dd0a2b41e9033bdd61a50d6ffd')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
