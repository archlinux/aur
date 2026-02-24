# Maintainer: nathan marchiori <nathan.marchiori@gmail.com>
pkgname="python-aw-core"
_name=${pkgname#python-}
pkgver=0.5.17
pkgrel=1
pkgdesc="Core library for ActivityWatch"
arch=("any")
url="https://github.com/ActivityWatch/aw-core"
license=('MPL-2.0')
depends=()
makedepends=(python-build python-installer git poetry)
provides=()
source=("$_name::git+https://github.com/ActivityWatch/aw-core")
sha256sums=("SKIP")

pkgver() {
	cd "$_name"
	printf "%s" "$(poetry version | awk '{print $NF}')"
}

build() {
	cd "$_name"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
