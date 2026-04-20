# Maintainer: Agil Mammadov <mammadovagil at tutamail dot com>
# Contributor: Ananas <ananas@ananas.moe>
_pkgname=pytubefix
pkgname=python-pytubefix
pkgver="8.12.2"
pkgrel=1
pkgdesc="A pytube fork with additional features and fixes"
arch=("x86_64" "i686")
url="https://github.com/JuanBindez/pytubefix"
license=("MIT")
makedepends=(
	"python-build" "python-installer"  "python-wheel"
)
depends=(
	"python"
)
optdepends=()
checkdepends=()
provides=("pytubefix")
conflicts=(	)
md5sums=("SKIP")
source=(
	"${pkgname}-${pkgver}.zip::https://github.com/JuanBindez/pytubefix/archive/refs/tags/v$pkgver.zip"
)

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
