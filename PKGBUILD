pkgname=toot
_name=toot
pkgver=0.20.0
pkgrel=1
pkgdesc="a Mastodon CLI client"
depends=('python-requests' 'python-beautifulsoup4')
license=('GPL3')
arch=('any')
url="https://github.com/ihabunek/toot"
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('4135f03549e50471fe394496161f1ef5fd7d4b0ce5edb0f809bbbe6e47599e55')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
