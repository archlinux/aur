# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=jsonpath-python
pkgname="python-${_pkgname}"
pkgver=1.0.6
pkgrel=2
pkgdesc="A more powerful JSONPath implementation in modern python"
arch=("any")
url="https://github.com/zhangxianbing/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('dd5be4a72d8a2995c3f583cf82bf3cd1a9544cfdabf2d22595b67aff07349666')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
