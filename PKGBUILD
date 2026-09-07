# Maintainer: Kannan Thambiah <kannan.thambiah@mailbox.org>

pkgname=mopidy-listenbrainz
pkgver=0.4.1
pkgrel=1
pkgdesc="Mopidy extension for scrobbling played tracks to listenbrainz"
arch=("any")
url="https://github.com/suaviloquence/mopidy-listenbrainz"
license=("Apache-2.0")
depends=(
	"mopidy>=4.0"
	"python"
	"python-musicbrainzngs"
	"python-pykka>=4.4.2"
	"python-httpx"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-setuptools"
	"python-wheel"
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('26ee657172a3b217487f62058dfbadfc1a9c3c09b0205737f68d2a05b3416502')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

