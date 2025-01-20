# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-tkintertools
_name=${pkgname#python-}
pkgver=2.6.21.1
pkgrel=2
epoch=
pkgdesc="The tkintertools module is an auxiliary module of the tkinter module."
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MulanPSL-2.0')
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-darkdetect
    python-pillow
    python-pilkit
    #AUR
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('aa9423ecc628bdfaf6189dcf3548e9a06fe170c4ff3e5379d926e7ca2c13c235')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
