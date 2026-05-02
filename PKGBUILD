# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-genio-bootrom
_name=${pkgname#python-}
pkgver=1.2.2
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
sha256sums=('595e908bf1977a6a41a984a2bbfa8257eb754ef8f0d68c1076e4559827f0573d')

package() {
    cd "${srcdir}/"
    python -m installer --destdir="${pkgdir}" ${_name//-/_}-$pkgver-py3-none-any.whl
}
