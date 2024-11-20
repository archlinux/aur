# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=milvus-lite
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}-bin"
pkgver=2.4.10
pkgrel=1
pkgdesc="A lightweight version of Milvus wrapped with Python."
arch=('x86_64' 'aarch64')
url="https://github.com/milvus-io/milvus-lite"
license=('Apache-2.0')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
depends=("python-tqdm")
makedepends=('python-installer')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}-py3-none-manylinux2014_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}-py3-none-manylinux2014_aarch64.whl")
sha256sums_x86_64=('211d2e334a043f9282bdd9755f76b9b2d93b23bffa7af240919ffce6a8dfe325')
sha256sums_aarch64=('240c7386b747bad696ecb5bd1f58d491e86b9d4b92dccee3315ed7256256eddc')
noextract=("${_pipname}-${pkgver}"-py3-none-manylinux2014_{x86_64,aarch64}.whl)

package() {
    python -m installer --destdir="${pkgdir}" "${_pipname}-${pkgver}-py3-none-manylinux2014_${CARCH}.whl"
}
