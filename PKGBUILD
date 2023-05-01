# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=types-retry
pkgname=python-$_name
pkgver=0.9.9.3
pkgrel=1
pkgdesc='Typing stubs for retry'
arch=(any)
url='https://github.com/python/typeshed'
license=('Apache')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('d42d07aa6c073d77ca1e30d05150736c66c14eb805adec3a67b0e8c2a310d0adc5e03487ebed1c0ead3c2a5999ef165e0a8ceb8a935adecd0001c216c6ab10bc')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
