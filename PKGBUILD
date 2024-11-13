# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-genio-bootrom
_name=${pkgname#python-}
pkgver=1.1.12
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
sha256sums=('b945f62d6ac6651522c739bac325b746f517b17080fbf652b476289e46051328')

package() {
    cd "${srcdir}/"
    python -m installer --destdir="${pkgdir}" ${_name//-/_}-$pkgver-py3-none-any.whl
}
