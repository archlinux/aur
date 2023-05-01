# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=django_upgrade
pkgname=django-upgrade
pkgver=1.13.0
pkgrel=1
pkgdesc='Automatically upgrade your Django projects.'
arch=('any')
url='https://github.com/adamchainz/django-upgrade'
license=('MIT')
depends=('python' 'python-tokenize-rt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('328f23151a51b961e00ba8be1b9ea96a35e264475a40b81f1907bbe261800d0d1b1da4339ee696c9eaf52fbebf7c7203a7f2d9832eec6c896e20ce5ef3ac4dae')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
