# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=('python-mediainfodll' 'python2-mediainfodll')
pkgbase=python-mediainfodll
pkgver=19.09
pkgrel=2
pkgdesc="Python shared library for reading metadata from media files"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
source=("MediaInfoLib-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfoLib/archive/v$pkgver.tar.gz")
sha256sums=('4cc409f6e5a0bfa95f8c48d95d31054a4f7b7ef0d03b1ab38abcd534d8688038')

package_python-mediainfodll() {
	pkgdesc="Python 3 shared library for reading metadata from media files"
	depends=('libmediainfo' 'python')

	cd "MediaInfoLib-$pkgver"
	install -Dm644 "Source/MediaInfoDLL/MediaInfoDLL.py" \
		"$pkgdir/usr/lib/python3.8/site-packages/MediaInfoDLL.py"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-mediainfodll() {
	pkgdesc="Python 2 shared library for reading metadata from media files"
	depends=('libmediainfo' 'python2')

	cd "MediaInfoLib-$pkgver"
	install -Dm644 "Source/MediaInfoDLL/MediaInfoDLL.py" \
		"$pkgdir/usr/lib/python2.7/site-packages/MediaInfoDLL.py"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
