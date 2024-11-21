# Maintainer: taotieren <admin@taotieren.com>

pkgbase=kicad-pcb-diff
pkgname=kicad-pcb-diff
_name=kidiff
pkgver=2.5.5
pkgrel=1
epoch=
pkgdesc="Tool to generate a PDF file showing the changes between two KiCad PCB/SCH files. Also a git plug-in."
arch=('any')
url="https://pypi.org/project/kidiff"
license=('GPL-2.0-or-later')
groups=()
depends=(python
    kicad
    #     python-wxpython
    #     imagemagick
    #     librsvg
    #     poppler
    #     xdg-utils
)
makedepends=(python-{build,installer}
    python-setuptools-scm
    python-wheel)
optdepends=("kiauto-git: KiCad automation scripts.")
provides=('kidiff' 'kicad-diff' 'kicad-pcb-diff' 'python-kidiff')
conflicts=('kidiff' 'kicad-diff' 'kicad-pcb-diff' 'python-kidiff')
replaces=()
backup=()
options=('!strip' '!debug')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
noextract=()
sha256sums=('e90c0e13cf2eefc375495cebbd470b427a739c824e6a7ea8a7c926b74be753e4')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer -d "$pkgdir" dist/*.whl
}
