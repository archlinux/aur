# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=django_upgrade
pkgname=django-upgrade
pkgver=1.15.0
pkgrel=1
pkgdesc='Automatically upgrade your Django projects.'
arch=('any')
url='https://github.com/adamchainz/django-upgrade'
license=('MIT')
depends=('python' 'python-tokenize-rt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('b4829d82f5acbb56195ba8f5067b722f435a1dbe3a34e53a292e77f4b56fe291fc952fcd415aacf3f4f5d9b024729c66628b9ac218d2900ee38037bdcbbd80c4')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
