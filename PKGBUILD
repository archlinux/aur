# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-qsnctf
_name=${pkgname#python-}
pkgver=0.0.9.2
pkgrel=1
epoch=
pkgdesc="青少年 CTF 训练平台是一个公益、免费、供给全国青少年学习、训练的 CTF 在线平台。"
arch=('any')
url="https://pypi.org/project/qsnctf"
license=('MIT')
groups=()
depends=(
    python
    python-pyexecjs
    python-pybase62
    python-base58
    python-requests
    python-beautifulsoup4
    python-sympy
    #     python-urllib3
    python-rarfile
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=()
optdepends=()
provides=(${pkgname} qsnctf qsnctf-python)
conflicts=(${pkgname} qsnctf qsnctf-python)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('cace2c005e340f1b826a4067d0185c28568521ceaeaf800bb4b46418813def38')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
