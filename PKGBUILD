# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax <cor dot ax26 at gmail dot com>
pkgname=python-mediainfodll
pkgver=0.7.88
pkgrel=1
epoch=1
pkgdesc="Python shared library for reading metadata from media files"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD')
depends=('libmediainfo' 'python')
source=("MediaInfoLib-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('54941617aa245e556b1bd94c613f90704ceefef3c77bb38a99f0667748ffe0fe')

package() {
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

	cd "MediaInfoLib-$pkgver"
	install -Dm644 Source/MediaInfoDLL/MediaInfoDLL.py -t "$pkgdir/$site_packages"
	install -Dm644 License.html -t "$pkgdir/usr/share/licenses/$pkgname"
}
