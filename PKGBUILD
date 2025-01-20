# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-tkintertools-media
_name=${pkgname#python-}
pkgver=1.1.3
pkgrel=1
epoch=
pkgdesc="Extension package for tkintertools to matplotlib."
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
_name=${_name//-/_}
depends=(
    python
    python-pillow
    python-typing_extensions
    #AUR
    python-ffpyplayer
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
sha256sums=('4da2e93aa330f596d9ba602d4fef63136c221afec4a20a7218bc0ec7e522c6e4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
