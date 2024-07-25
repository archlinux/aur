# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
# Previous Maintainer: Freed <https://freed-wu.github.io/>

pkgname=python-plotext
_name=${pkgname#python-}
pkgver=5.2.8
pkgrel=2
pkgdesc="plotting on terminal"
arch=(any)
url=https://github.com/piccolomo/plotext
makedepends=(python-installer python-shtab python-build)
license=(MIT)
source=("https://github.com/piccolomo/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9080878520c09c50b5ebea2ca48eab77f41ea60bff751cd6219222a770ada3a7')

build(){
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
