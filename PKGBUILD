# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="dwatch"
pkgver="0.4.1"
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
sha256sums=("a248eae975039b0f3ee2ea49c7490cb2bf183e4879a77788e8bf48ffe741a9b2")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
