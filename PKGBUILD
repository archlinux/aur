# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=django-upgrade
pkgver=1.12.0
pkgrel=1
pkgdesc='Automatically upgrade your Django projects.'
arch=('any')
url='https://github.com/adamchainz/django-upgrade'
license=('MIT')
depends=('python' 'python-tokenize-rt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('6633abdfd3dc05d032d8818e4a0bab5af180ce79c133eacb962d22346a590418bc140597683b694bc003c677844830190b818f633a5b701b7958c1053860422f')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
