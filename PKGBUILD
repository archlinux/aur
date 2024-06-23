# Maintainer: Ananas <ananas@ananas.moe>
# Maintainer: Goldy <goldy@devgoldy.xyz>
_pkgname=mov-cli-soundcloud
pkgname=python-mov-cli-soundcloud
pkgver="1.0.1"
pkgrel=1
pkgdesc="A mov-cli v4 plugin for playing soundcloud."
arch=("x86_64" "i686")
url="https://github.com/mov-cli/mov-cli-soundcloud"
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
provides=("mov-cli-soundcloud")
conflicts=()
md5sums=("SKIP")
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/mov-cli/mov-cli-soundcloud/archive/refs/tags/$pkgver.zip"
)

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
