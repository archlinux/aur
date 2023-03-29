# Maintainer: taotieren <admin@taotieren.com>

pkgbase=kicad-pcb-diff
pkgname=kidiff
pkgver=2.4.6
pkgrel=0
epoch=
pkgdesc="Tool to generate a PDF file showing the changes between two KiCad PCB/SCH files. Also a git plug-in."
arch=('any')
url="https://github.com/INTI-CMNB/KiDiff"
license=('GPL-2.0')
groups=()
depends=('python' 'kicad' 'python-wxpython' 'imagemagick' 'librsvg' 'poppler' 'xdg-utils')
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
optdepends=("kiauto-git: KiCad automation scripts.")
provides=('kidiff' 'kicad-diff' 'kicad-pcb-diff')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("KiDiff-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('0888f06d20dd3c36a636919c7ade208f0b159cd6f6ea348bd1b5b805ae87d544')
#validpgpkeys=()

build() {
    cd "${srcdir}/KiDiff-${pkgver}"
    python -m build -wn
}

package() {
    cd "${srcdir}/KiDiff-${pkgver}"
    python -m installer -d "$pkgdir" dist/*.whl
}
