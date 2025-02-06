# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-text-splitters
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.6
pkgrel=1
pkgdesc="null"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/text-splitters"
license=('MIT')
depends=()
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('c537972f4b7c07451df431353a538019ad9dadff7a1073ea363946cea97e1bee')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
