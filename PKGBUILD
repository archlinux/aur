# Maintainer: Chau Duong <duongdominhchau@gmail.com>
_pkgname=mdformat-admon
pkgname="${_pkgname}-git"
pkgver=1.0.2
pkgrel=1
pkgdesc="An mdformat plugin for admonitions."
arch=(any)
url="https://github.com/KyleKing/mdformat-admon"
license=('MIT')
depends=(mdformat python-mdit_py_plugins)
makedepends=(
    python-pip
    python-build
    python-wheel
    python-flit
    python-installer
)
source=("${_pkgname}::git+https://github.com/KyleKing/mdformat-admon.git")
sha256sums=(SKIP)

build() {
	cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
