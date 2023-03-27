# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-qsnctf
_name=${pkgname#python-}
pkgver=0.0.8.9
pkgrel=0
epoch=
pkgdesc="青少年 CTF 训练平台是一个公益、免费、供给全国青少年学习、训练的 CTF 在线平台。"
arch=('any')
url="https://pypi.org/project/qsnctf"
license=('MIT')
groups=()
depends=(python
        python-pyexecjs
        python-pybase62
        python-base58
        python-requests
        python-bs4
        python-urllib3
        python-rarfile)
makedepends=(python-build
            python-installer
            python-wheel)
checkdepends=()
optdepends=()
provides=(qsnctf qsnctf-python)
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('f294a64a4822d1b2058a1da2e444bd9c2c793f2920c176ff2e5145086f4ad45b')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
