# Maintainer: taotieren <admin@taotieren.com>

pkgbase=kicad-pcb-diff
pkgname=kicad-pcb-diff
pkgver=2.5.3
pkgrel=3
epoch=
pkgdesc="Tool to generate a PDF file showing the changes between two KiCad PCB/SCH files. Also a git plug-in."
arch=('any')
url="https://github.com/INTI-CMNB/KiDiff"
license=('GPL-2.0')
groups=()
depends=(python
    kicad
    python-wxpython
    imagemagick
    librsvg
    poppler
    xdg-utils)
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
optdepends=("kiauto-git: KiCad automation scripts.")
provides=('kidiff' 'kicad-diff' 'kicad-pcb-diff' 'python-kidiff')
conflicts=('kidiff' 'kicad-diff' 'kicad-pcb-diff' 'python-kidiff')
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("KiDiff-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('32184714ae0aa54b38c457e0327a1d250492a22ceab0914f2a115c4f93210832')
#validpgpkeys=()

build() {
    cd "${srcdir}/KiDiff-${pkgver}"
    python -m build -wn
}

package() {
    cd "${srcdir}/KiDiff-${pkgver}"
    python -m installer -d "$pkgdir" dist/*.whl
}
