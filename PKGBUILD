# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="dwatch"
pkgver="0.4.0"
pkgrel="1"
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
sha256sums=("dc704b03576e6feeb6dc3080196696d903a34d71a4454009cfc1c5ac1fa77320")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
