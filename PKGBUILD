# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.6.0
pkgrel=1
pkgdesc="Command-line program to download image galleries and collections from pixiv, exhentai, danbooru and more"
arch=('x86_64')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'zip: Store downloaded files in a ZIP archive'
	    'youtube-dl: Download videos')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/gallery_dl-${pkgver}.tar.gz
	https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/gallery_dl-${pkgver}.tar.gz.asc)
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha512sums=('c11348b2b523d602cf1a4948900769f028c95ca5fc3cc8196a2a413f6d029bfa1597f1df6cbf3968d08ab95601b5b8cd78cbecf4b5104a24d43443e4bb379f13'
	    'SKIP')
package() {
  cd "$srcdir"/gallery_dl-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
