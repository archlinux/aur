# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=quimb
pkgname=python-$_name
pkgver=1.7.0
pkgrel=1
pkgdesc='Quantum information and many-body library.'
arch=(any)
url='https://github.com/jcmgray/quimb'
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('93e6e459b81a7d2165fdf7bcfbdb93639992f1006ffdde84d4feb192466e58c167ee9da41a38328baf5713f0b33352c4dcbc8b33033b935d64f934836071baf3')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
