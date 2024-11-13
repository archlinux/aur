# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-genio-tools
_name=${pkgname#python-}
pkgver=1.4.2
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
    #AUR
    genio-bootrom
    gpiod
    pyftdi)
depends=(
    python
    "${_pymakedeps[@]/#/python-}")
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
sha256sums=('3c8b6dc48892a6f9a88a9ff081caac31dd1f29e31466a8bfa06ed686f05068c0')

package() {
    cd "${srcdir}/"
    python -m installer --destdir="${pkgdir}" ${_name//-/_}-$pkgver-py3-none-any.whl
}
