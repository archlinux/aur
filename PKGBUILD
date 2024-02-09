# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=quimb
pkgname=python-$_name
pkgver=1.7.3
pkgrel=1
pkgdesc='Quantum information and many-body library.'
arch=(any)
url='https://github.com/jcmgray/quimb'
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('3338afa14c8999f745a575f7414ebf04d0cc676a9cbc2f981d8a827c4bc988b7123d071a95c49f43bcc1ec096a34661ab25efe98d20042b2a2986ebcb10eb998')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
