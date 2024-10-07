# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-lsassy
_pypiname=lsassy
pkgver=3.1.12
pkgrel=1
pkgdesc="Python library to remotely extract credentials on a set of hosts"
url="https://github.com/Hackndo/lsassy"
arch=('any')
license=('MIT')
depends=('python' 'impacket' 'python-netaddr' 'python-pypykatz')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/Hackndo/lsassy/archive/v${pkgver}.tar.gz")
sha256sums=('d0c23d92a3bc2834ea26fafdcea7bfe5161ee4f2aac922c2055a42be052a56b2')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
