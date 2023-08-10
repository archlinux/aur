pkgname=python-keyring-pass
_pkgname=keyring_pass
pkgver=0.8.1
pkgrel=1
pkgdesc='https://www.passwordstore.org backend for keyring'
arch=('any')
url='https://github.com/nazarewk/keyring_pass'
license=('MIT')
depends=('python-keyring' 'python-jaraco.classes' 'pass')
makedepends=('python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/k/${_pkgname/_/-}/$_pkgname-$pkgver.tar.gz")
sha512sums=('25a288f5e6fd92d3848bbd9ea81b4bb7aa1da2318b635ad8980eff1d6b75892759684d639f34453f2ea98dcc07ec0228ce1436f5ed9ed3d8dbbb615fbc946a8e')


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
