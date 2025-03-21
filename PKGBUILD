# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=milvus-lite
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}-bin"
pkgver=2.4.12
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
sha256sums_x86_64=('334037ebbab60243b5d8b43d54ca2f835d81d48c3cda0c6a462605e588deb05d')
sha256sums_aarch64=('a0f3a5ddbfd19f4a6b842b2fd3445693c796cde272b701a1646a94c1ac45d3d7')
noextract=("${_pipname}-${pkgver}"-py3-none-manylinux2014_{x86_64,aarch64}.whl)

package() {
    python -m installer --destdir="${pkgdir}" "${_pipname}-${pkgver}-py3-none-manylinux2014_${CARCH}.whl"
}
