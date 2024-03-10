# Maintainer: Atte Lautanala <atte@lautana.la>
pkgname=python-keyring-pass
_pkgname=keyring_pass
pkgver=0.9.3
pkgrel=1
pkgdesc='https://www.passwordstore.org backend for keyring'
arch=('any')
url='https://github.com/nazarewk/keyring_pass'
license=('MIT')
depends=('python-keyring' 'python-jaraco.classes' 'pass')
makedepends=('python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/k/${_pkgname/_/-}/$_pkgname-$pkgver.tar.gz")
b2sums=('e0da97f33347493dc5411144795699a850238e095cfd2abb7602443cff297d3ffcac4fb3adab98cbed34b9c1d3308053e40cf6a80f7ba14cf54ba63b2e79a4b2')


build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
