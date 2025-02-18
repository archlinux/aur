# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-yacl"
pkgver="0.6.1"
pkgrel="1"
pkgdesc="Yet another color logger for Python."
arch=("any")
url="https://github.com/IngoMeyer441/yacl"
license=("MIT")
depends=("python" "python-pygments")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://github.com/IngoMeyer441/yacl/archive/v${pkgver}.tar.gz")
sha256sums=("8985d21179573ea873b89530d83c6a08f960953821140c5644123dcf45d8aba4")

build() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
    python -m installer --destdir="$pkgdir" dist/*.whl
}
