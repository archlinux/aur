# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=milvus-lite
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}-bin"
pkgver=2.5.0
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
b2sums_x86_64=('15fb95359a718f940ec8a0362a25a0f6bccd25c640aa351c5b94652ac3ca011a3fc974fd28d1654a581d2b73dc3c6eb50282ae6d38c1740ff3ade5e1b3ad0749')
b2sums_aarch64=('a11a00e23190056feda96c7dba7c2d7fb3024be80f8744d2c5be9d42b6a606b9153a99dc1bcfa645ca7af299fc2396eb619cad62ad19992adc99718dfd4e1a3a')
noextract=("${_pipname}-${pkgver}"-py3-none-manylinux2014_{x86_64,aarch64}.whl)

package() {
    python -m installer --destdir="${pkgdir}" "${_pipname}-${pkgver}-py3-none-manylinux2014_${CARCH}.whl"
}
