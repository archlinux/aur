# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-tkintertools
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
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
    python-setuptools-scm
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
sha256sums=('871639d317763c89a84fa0887779ad88c37176a607cfc006909200e7cd763f55')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
