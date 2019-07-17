# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=('python-mediainfodll' 'python2-mediainfodll')
pkgbase=python-mediainfodll
pkgver=19.07
pkgrel=1
pkgdesc="Python shared library for reading metadata from media files"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
source=("MediaInfoLib-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfoLib/archive/v$pkgver.tar.gz")
sha256sums=('34b963c1d99674e76139f7fc6b79bcb91752472f9813c5e50e7fc510dc6546a6')

package_python-mediainfodll() {
	pkgdesc="Python 3 shared library for reading metadata from media files"
	depends=('libmediainfo' 'python')

	cd "MediaInfoLib-$pkgver"
	install -Dm644 "Source/MediaInfoDLL/MediaInfoDLL.py" \
		"$pkgdir/usr/lib/python3.7/site-packages/MediaInfoDLL.py"
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
