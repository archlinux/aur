_pkgname=pysvg-py3
pkgname=python-${_pkgname/-py3/}
pkgver=0.2.2
pkgrel=1
pkgdesc='Python 3 portage of pysvg'
arch=('any')
url='https://github.com/alorence/pysvg-py3'
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+$url#tag=${pkgver}-post3")
sha512sums=('SKIP')

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --root="$pkgdir" \
           --optimize=1 \
           --skip-build
    install -Dm 644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}

# vim:set ts=2 sw=2 et:
