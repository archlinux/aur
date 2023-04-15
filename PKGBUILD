# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=mulimgviewer
pkgname=python-$_pkgname
pkgver='3.9.10'
pkgrel=2
pkgdesc="A multi-image viewer that can open multiple images in one interface, which is convenient for image comparison and image stitching."
arch=(any)
url=https://github.com/nachifur/MulimgViewer
makedepends=(python-installer)
depends=(python-piexif python-pillow python-requests python-wxpython)
license=(GPLv3)
source=(
	"$url/releases/download/$pkgver/${_pkgname//-/_}-$pkgver-py3-none-any.whl"
)
sha256sums=('e0c21750af6565e4358f211d900c39399cbd09b6f7d7435ca931dc47d81efba1')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
