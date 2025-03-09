# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=wget
pkgname=python-${_plug}
pkgver=3.2
pkgrel=1
pkgdesc="Python Package: ${_plug} (GIT version)"
arch=('any')
url='https://pypi.org/project/wget/'
license=('MIT')
depends=('python')
makedepends=(
    'git'
    'python-build'
    'python-wheel'
    'python-installer'
    'python-setuptools'
)
provides=("python-${_plug}")
conflicts=("python-${_plug}")
source=("${_plug}::https://files.pythonhosted.org/packages/47/6a/62e288da7bcda82b935ff0c6cfe542970f04e29c756b0e147251b2fb251f/wget-3.2.zip")
sha256sums=('SKIP')

build() {
    cd "${_plug}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_plug}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
