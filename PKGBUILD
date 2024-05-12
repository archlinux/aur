# Maintainer: Ananas <ananas@r3tr0ananas.pro>
# Maintainer: Goldy <goldy@devgoldy.xyz>
_pkgname=mov-cli-media-server
pkgname=python-mov-cli-ms
pkgver="1.0.0"
pkgrel=1
pkgdc="A mov-cli v4 plugin for watching files on your device."
arch=("x86_64" "i686")
url="https://github.com/mov-cli/mov-cli-media-server"
license=("MIT")
makedepends=(
	"python-build" "python-wheel"
)
depends=(
	"python"
)
optdepends=()
checkdepends=()
provides=("mov-cli-ms")
conflicts=()
md5sums=("SKIP")
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/mov-cli/mov-cli-media-server/archive/refs/tags/$pkgver.zip"
)

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}