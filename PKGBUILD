# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
# Previous Maintainer: Freed <https://freed-wu.github.io/>

pkgname=python-plotext
_name=${pkgname#python-}
pkgver=5.3.2
pkgrel=1
pkgdesc="plotting on terminal"
arch=(any)
url=https://github.com/piccolomo/plotext
makedepends=(python-installer python-shtab python-build)
license=(MIT)
source=("https://github.com/piccolomo/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c4e1277f4c4157655b059402f8b35fe8c855abc397cfc9dcb8bc0c5dc9383a98')

build(){
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
