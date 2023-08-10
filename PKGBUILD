pkgname=python-keyring-pass
_pkgname=keyring_pass
pkgver=0.7.1
pkgrel=1
pkgdesc='https://www.passwordstore.org backend for keyring'
arch=('any')
url='https://github.com/nazarewk/keyring_pass'
license=('MIT')
depends=('python-keyring' 'python-jaraco.classes' 'pass')
makedepends=('python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/k/${_pkgname/_/-}/$_pkgname-$pkgver.tar.gz")
sha512sums=('c5e7895c4b2e74d6f6797bde12fbf8f156387457b9269a36ba97ad1940b08cf4ed840e1c599198fb5cbbf522c6a24f7a618757bdf33c65e6f8ca7770df464408')


build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
