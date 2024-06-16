# Maintainer: Ananas <ananas@ananas.moe>
# Maintainer: Goldy <goldy@devgoldy.xyz>
_pkgname=mov-cli-test
pkgname=python-mov-cli-test
pkgver="1.1.7"
pkgrel=1
pkgdesc="A mov-cli v4 plugin to test mov-cli's capabilities."
arch=("x86_64" "i686")
url="https://github.com/mov-cli/mov-cli-test"
license=("MIT")
makedepends=(
	"python-build" "python-wheel" "python-installer"
)
depends=(
	"python"
	"python-pytubefix"
)
optdepends=()
checkdepends=()
provides=("mov-cli-test")
conflicts=(	)
md5sums=("SKIP")
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/mov-cli/mov-cli-test/archive/refs/tags/$pkgver.zip"
)

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}