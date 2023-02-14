# Maintainer: taotieren <admin@taotieren.com>

pkgbase=kicad-pcb-diff
pkgname=kidiff
pkgver=2.4.4
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
sha256sums=('caf86cb0cf7a20134c7a21832728ca4e5a5702f4af90bfded070a9a34cd23aa0')
#validpgpkeys=()

build() {
    cd "${srcdir}/KiDiff-${pkgver}"
    python -m build -wn
}

package() {
    cd "${srcdir}/KiDiff-${pkgver}"
    python -m installer -d "$pkgdir" dist/*.whl
}
