# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax <cor dot ax26 at gmail dot com>
pkgname=python-mediainfodll
pkgver=19.09
pkgrel=2
pkgdesc="Python shared library for reading metadata from media files"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
depends=('libmediainfo' 'python')
source=("MediaInfoLib-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4cc409f6e5a0bfa95f8c48d95d31054a4f7b7ef0d03b1ab38abcd534d8688038')

package() {

	_pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"

	cd "MediaInfoLib-$pkgver"
	install -Dm644 "Source/MediaInfoDLL/MediaInfoDLL.py" -t \
		"$pkgdir/usr/lib/python$_pyver/site-packages"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
