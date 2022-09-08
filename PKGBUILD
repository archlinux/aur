pkgname=python-keyring-pass
_pkgname=keyring_pass
pkgver=0.7.0
pkgrel=1
pkgdesc='https://www.passwordstore.org backend for keyring'
arch=('any')
url='https://github.com/nazarewk/keyring_pass'
license=('MIT')
depends=('python-keyring' 'pass')
makedepends=('git' 'python-setuptools')
source=("git+$url#tag=v$pkgver")
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
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
