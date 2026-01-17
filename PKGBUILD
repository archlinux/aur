# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-genio-tools
_name=${pkgname#python-}
pkgver=1.7.0
pkgrel=4
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

    fastboot-log-parser
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
sha256sums=('f46225a0d4f2b456df32d133a64bb6aae80f0c33818b65ac7d3efd12ea5f3724')

package() {
    cd "${srcdir}/"
    python -m installer --destdir="${pkgdir}" ${_name//-/_}-$pkgver-py3-none-any.whl
}
