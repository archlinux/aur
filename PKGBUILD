# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=quimb
pkgname=python-$_name
pkgver=1.5.1
pkgrel=1
pkgdesc='Quantum information and many-body library.'
arch=(any)
url='https://github.com/jcmgray/quimb'
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('5cb31d73a61f22fa8dd7519831c841547a1a75203e0d743de6129b482eacb7784a32277180de3d7aba5ac9ce64abe418d157da07c7b4c2e0d55f9537ae82f434')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
