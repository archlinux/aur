# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=ebcdic
pkgname="python-${_pkgname}"
pkgver=1.1.1
pkgrel=1
pkgdesc="Additional EBCDIC codecs"
arch=("any")
url="https://pypi.org/project/${_pkgname}"
license=('BSD-2-Clause-first-lines')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/roskakori/CodecMapper/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7a1a77fdc7e87924e42826087bd9c0c4b48b779156c10cabc94eec237739c818')

build() {
    cd "CodecMapper-${pkgver}/${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "CodecMapper-${pkgver}/${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
