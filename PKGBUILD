# Maintainer: Ananas <ananas@ananas.moe>
# Maintainer: Goldy <goldy@devgoldy.xyz>
_pkgname=mov-cli-files
pkgname=python-mov-cli-files
pkgver="1.1.1"
pkgrel=1
pkgdesc="A mov-cli v4 plugin for watching files on your device."
arch=("x86_64" "i686")
url="https://github.com/mov-cli/mov-cli-files"
license=("MIT")
makedepends=(
	"python-build" "python-wheel" "python-installer"
)
depends=(
	"python"
	"mov-cli"
)
optdepends=()
checkdepends=()
provides=("mov-cli-files")
conflicts=(	)
md5sums=("SKIP")
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/mov-cli/mov-cli-files/archive/refs/tags/$pkgver.zip"
)

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}