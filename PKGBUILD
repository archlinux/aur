# Maintainer: taotieren <admin@taotieren.com>

pkgname=kibot
pkgver=1.7.0
pkgrel=1
epoch=
pkgdesc="KiCad automation utility"
arch=('any')
url="https://github.com/INTI-CMNB/KiBot"
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
    pcbdraw
    python
    python-kiauto
    python-kibom
    python-colorama
    python-lark-parser
    python-lxml
    python-kikit
    python-numpy
    python-markdown2
    python-mistune
    python-pyaml
    python-qrcodegen
    python-requests
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
provides=(kibot)
conflicts=(kibot kibot-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("KiBot-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('f4f0cf1f8e3da3f3919957ae3e041ce1e44f752aa281798f0c1ddedb95e70c5e')
#validpgpkeys=()

build() {
    cd "${srcdir}/KiBot-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/KiBot-${pkgver}"
    # python setup.py install --no-compile --root="$pkgdir"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
