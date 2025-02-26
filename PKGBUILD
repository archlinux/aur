# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="dwatch"
pkgver="0.3.0"
pkgrel="3"
pkgdesc="A tool to watch command output for differences and send notifications."
arch=("any")
url="https://github.com/IngoMeyer441/dwatch"
license=("MIT")
depends=(
    "python"
    "python-jinja"
    "python-lockfile"
    "python-yacl"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
source=("https://github.com/IngoMeyer441/dwatch/archive/v${pkgver}.tar.gz")
sha256sums=("fce9dc3d6d1dfae718e04198376afaa679a44452eec8ec6b897827b134d0b361")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
