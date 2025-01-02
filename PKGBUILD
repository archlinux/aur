# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=milvus-lite
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}-bin"
pkgver=2.4.11
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
sha256sums_x86_64=('551f56b49fcfbb330b658b4a3c56ed29ba9b692ec201edd1f2dade7f5e39957d')
sha256sums_aarch64=('8e6ef27f7f84976f9fd0047b675ede746db2e0cc581c44a916ac9e71e0cef05d')
noextract=("${_pipname}-${pkgver}"-py3-none-manylinux2014_{x86_64,aarch64}.whl)

package() {
    python -m installer --destdir="${pkgdir}" "${_pipname}-${pkgver}-py3-none-manylinux2014_${CARCH}.whl"
}
