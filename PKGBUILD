# Maintainter: Corax <cor dot ax26 at gmail dot com>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python2-mediainfodll
pkgver=19.09
pkgrel=2
pkgdesc="Python shared library for reading metadata from media files"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
depends=('libmediainfo' 'python2')
source=("MediaInfoLib-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfoLib/archive/v$pkgver.tar.gz")
sha256sums=('4cc409f6e5a0bfa95f8c48d95d31054a4f7b7ef0d03b1ab38abcd534d8688038')

package() {

	_py2ver="$(python2 -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"

	cd "MediaInfoLib-$pkgver"
	install -Dm644 "Source/MediaInfoDLL/MediaInfoDLL.py" -t \
		"$pkgdir/usr/lib/python$_py2ver/site-packages"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
