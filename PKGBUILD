# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax <cor dot ax26 at gmail dot com>
pkgname=python-mediainfodll
pkgver=20.03
pkgrel=1
pkgdesc="Python shared library for reading metadata from media files"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
depends=('libmediainfo' 'python')
source=("MediaInfoLib-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2a1da41b94aa5380c537f198f3c797fd9ef23891709e935143e4535099437311')

package() {

	local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

	cd "MediaInfoLib-$pkgver"
	install -Dm644 "Source/MediaInfoDLL/MediaInfoDLL.py" -t "$pkgdir/$_site_packages"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
