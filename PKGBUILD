# Maintainer: taotieren <admin@taotieren.com>

pkgname=kibot
pkgver=2
pkgrel=1
epoch=
pkgdesc="KiCad automation utility"
arch=('any')
url="https://github.com/INTI-CMNB/KiBot"
license=('GPL-3.0')
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
makedepends=("python-setuptools")
checkdepends=(python-pytest)
optdepends=('kicad-interactivehtmlbom: Interactive HTML BOM generation plugin for KiCad'
    'kicad-library: KiCad symbol, footprint and template libraries'
    'kicad-library-3d: KiCad 3D model libraries')
provides=()
conflicts=(kibot-git)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('2d0881c0df5e3e61b1e461d04a0ae3c927eb0da3952733caf668b4887d84d748')
#validpgpkeys=()

package() {
    cd "${srcdir}/KiBot-${pkgver}"
    python setup.py install --no-compile --root="$pkgdir"
}
