# Maintainer: Atte Lautanala <atte@lautana.la>
pkgname=python-keyring-pass
_pkgname=keyring_pass
pkgver=0.9.2
pkgrel=1
pkgdesc='https://www.passwordstore.org backend for keyring'
arch=('any')
url='https://github.com/nazarewk/keyring_pass'
license=('MIT')
depends=('python-keyring' 'python-jaraco.classes' 'pass')
makedepends=('python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/k/${_pkgname/_/-}/$_pkgname-$pkgver.tar.gz")
b2sums=('e95cca011ac258499dd66b5afe52981aa10555262e7c7864fe337fe75e557c83cedfb43e3cf43f7835884879d39540cebb005220b81b5a2ab49ef7da946b8765')


build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
