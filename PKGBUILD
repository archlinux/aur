# Maintainer: Ananas <ananas@ananas.moe>
# Maintainer: Goldy <goldy@devgoldy.xyz>
_pkgname=mov-cli-youtube
pkgname=python-mov-cli-youtube
pkgver="1.3.8"
pkgrel=1
pkgdesc="A mov-cli v4 plugin for watching youtube."
arch=("x86_64" "i686")
url="https://github.com/mov-cli/mov-cli-youtube"
license=("MIT")
makedepends=(
	"python-build" "python-wheel" "python-installer"
)
depends=(
	"python"
	"mov-cli"
	"python-pytubefix"
	"yt-dlp"
)
optdepends=()
checkdepends=()
provides=("mov-cli-youtube")
conflicts=()
md5sums=("SKIP")
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/mov-cli/mov-cli-youtube/archive/refs/tags/$pkgver.zip"
)

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}