# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=django-upgrade
pkgver=1.10.0
pkgrel=1
pkgdesc='Automatically upgrade your Django projects.'
arch=('any')
url='https://github.com/adamchainz/django-upgrade'
license=('MIT')
depends=('python' 'python-tokenize-rt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('60fc705e6e9b3e986c2a58bb4f28d920a40c851fb9f5eb3d9a11b25444b95fe383eb533dc4401dec72ed6b68c74fd90965f8c1823417ccceae66899e9c984a26')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
