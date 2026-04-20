# Maintainer: Agil Mammadov <mammadovagil at tutamail dot com>
# Contributor: Ananas <ananas@ananas.moe>
_pkgname=pytubefix
pkgname=python-pytubefix
pkgver=10.3.8
pkgrel=2
pkgdesc="A pytube fork with additional features and fixes"
arch=("any")
url="https://github.com/JuanBindez/pytubefix"
license=("MIT")
makedepends=("python-build" "python-installer" "python-wheel")
depends=("python")
provides=("pytubefix")
sha256sums=('02984432fe14247ab8dbd98805e3d3e37c80058335df0276c5c75ea460c97212')
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
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
