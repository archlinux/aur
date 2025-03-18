# Maintainer: taotieren <admin@taotieren.com>

pkgname=kibot
_name=${pkgname}
pkgver=1.8.3
pkgrel=1
epoch=
pkgdesc="KiCad automation utility"
arch=('any')
url="https://pypi.org/project/kibot"
license=('AGPL-3.0-or-later')
groups=()
depends=(
    blender
    ghostscript
    git
    librsvg
    imagemagick
    openscad
    rar
    kicad
    kicad-pcb-diff
    kicost
    pandoc
    python
    python-colorama
    python-configparser
    python-lark-parser
    python-lxml
    python-kiauto
    python-kibom
    python-kikit
    python-numpy
    python-markdown2
    python-mistune
    python-pyaml
    python-pybars3
    python-pypdf2
    python-qrcodegen
    python-requests
    python-scipy
    python-svgwrite
    python-svgpathtools
    python-wheel
    python-wxpython
    python-xlsxwriter
    python-xvfbwrapper
    python-yaml
    xorg-server-xvfb
)
makedepends=('python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git')
checkdepends=(python-pytest)
optdepends=('kicad-interactivehtmlbom: Interactive HTML BOM generation plugin for KiCad'
    'kicad-library: KiCad symbol, footprint and template libraries'
    'kicad-library-3d: KiCad 3D model libraries')
provides=(kibot pcbdraw)
conflicts=(kibot pcbdraw)
replaces=()
backup=()
options=()
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('e2b41a448654754fa85b1e5b5f9af1554b9ee8fbffbe0f21fb258e6a695bcd6f')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    # python setup.py install --no-compile --root="$pkgdir"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
