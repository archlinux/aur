# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-tkintertools-3d
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="Extension package for tkintertools to simple 3D drawings."
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
_name=${_name//-/_}
depends=(
    python
    python-typing_extensions
    #AUR
    python-tkintertools
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
sha256sums=('30532c4a3bdce0c8b5bf71174c356e4ecb2c3debf85def523b3c00ca1775bc94')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
