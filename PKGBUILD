# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-lsassy
_pypiname=lsassy
pkgver=3.1.10
pkgrel=1
pkgdesc="Python library to remotely extract credentials on a set of hosts"
url="https://github.com/Hackndo/lsassy"
arch=('any')
license=('MIT')
depends=('python' 'impacket' 'python-netaddr' 'python-pypykatz')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/Hackndo/lsassy/archive/v${pkgver}.tar.gz")
sha256sums=('7f4ae138d30a17e32910891aea3dc9649779098bb6122b5a9b529f54c475adec')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
