# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=gritql
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Python bindings for GritQL"
arch=('any')
url='https://github.com/getgrit/gritql'
license=('MIT')
depends=('python-typer' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('b38d21d4ad08664f466fa68c29181e37eec8fa012fc215fb521849ef121d43ea5174d4b4b48f0bfe13c750317fe153a2cb8b54098aa202dd60b7aaa6fe1e5d7a')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
