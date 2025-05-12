# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-genio-tools
_name=${pkgname#python-}
pkgver=1.6.2
pkgrel=1
epoch=
pkgdesc="Tools for flashing boards using MediaTek Genio SoCs"
arch=('any')
url="https://pypi.org/project/genio-tools"
license=(MIT)
groups=()
_pydeps=(
    oyaml
    packaging
    pyudev
    pyusb

    genio-bootrom
    gpiod
    pyftdi)
depends=(
    python
    "${_pydeps[@]/#/python-}")
_pymakedeps=(
    build
    installer
    wheel
    setuptools)
makedepends=(
    "${_pymakedeps[@]/#/python-}")
optdepends=()
options=('!strip' '!debug')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
noextract=()
sha256sums=('86b3bcaac1d28cffd9fa52ebff32ec3ee1feee59449cec4c8bceb0e85f4aa1ad')

package() {
    cd "${srcdir}/"
    python -m installer --destdir="${pkgdir}" ${_name//-/_}-$pkgver-py3-none-any.whl
}
