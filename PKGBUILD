# Maintainer: Ananas <ananas@ananas.moe>
# Maintainer: Goldy <goldy@devgoldy.xyz>
_pkgname=mov-cli-jellyplex
pkgname=python-mov-cli-jellyplex
pkgver="1.1.3"
pkgrel=1
pkgdesc="A mov-cli v4 plugin for watching content from a media server hosting jellyfin or plex."
arch=("x86_64" "i686")
url="https://github.com/mov-cli/mov-cli-jellyplex"
license=("MIT")
makedepends=(
	"python-build" "python-wheel" "python-installer"
)
depends=(
	"python"
	"python-plexapi"
	"mov-cli"
)
optdepends=()
checkdepends=()
provides=("mov-cli-jellyplex")
conflicts=()
md5sums=("SKIP")
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/mov-cli/mov-cli-jellyplex/archive/refs/tags/$pkgver.zip"
)

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}