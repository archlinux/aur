# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-genio-tools
_name=${pkgname#python-}
pkgver=1.6.1
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
sha256sums=('067ad02d77639e29da5cfd957097467a81c4d1b4dc5dfcd678dc7dd1f68f5e52')

package() {
    cd "${srcdir}/"
    python -m installer --destdir="${pkgdir}" ${_name//-/_}-$pkgver-py3-none-any.whl
}
