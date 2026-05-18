# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-genio-bootrom
_name=${pkgname#python-}
pkgver=1.2.3
pkgrel=1
epoch=
pkgdesc="Tool to bootstrap the flashing on MediaTek Genio SoCs"
arch=('any')
url="https://pypi.org/project/genio-bootrom"
license=(MIT)
groups=()
depends=(
    glibc
    python
    systemd-libs)
_pymakedeps=(
    build
    installer
    wheel
    setuptools)
makedepends=(
    "${_pymakedeps[@]/#/python-}")
optdepends=('python-genio-tools: Tools for flashing boards using MediaTek Genio SoCs')
options=('!strip' '!debug')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
noextract=()
sha256sums=('de1e8bad86699c3298f52eb64018d7a3152fb9b01803a2d84a322ff059956a1a')

package() {
    cd "${srcdir}/"
    python -m installer --destdir="${pkgdir}" ${_name//-/_}-$pkgver-py3-none-any.whl
}
