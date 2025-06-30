# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=milvus-lite
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}-bin"
pkgver=2.5.1
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
b2sums_x86_64=('a567fd8967141477e799022b1c4fe0aac180ee6a429c8bff8c69f7f41798b13ee55b6cb1a805d1eaf10d740269b34aa9289972b94cf599362fc2c952cf783555')
b2sums_aarch64=('14509683071ccb6d7f364ac03eeed82343f6bd522608daab3bac4da5bccb0111d03b7e13d9c3a09e300f0ae79660f75dca2743e791fee233b9705046a5c45899')
noextract=("${_pipname}-${pkgver}"-py3-none-manylinux2014_{x86_64,aarch64}.whl)

package() {
    python -m installer --destdir="${pkgdir}" "${_pipname}-${pkgver}-py3-none-manylinux2014_${CARCH}.whl"
}
