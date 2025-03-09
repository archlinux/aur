# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-qsnctf
_name=${pkgname#python-}
pkgver=0.0.8.10
pkgrel=9
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
sha256sums=('035976963aa96bb536c1f3d0d36d2d86a2186555b0ae18c4a37a1ec3b8429e74')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
