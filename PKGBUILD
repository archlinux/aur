# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.7.0
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
sha512sums=('66906e7345fd9847fcd7d4a9af16714decd45704d88a507c9ad33312bce1d80338dc45be4ffa67068f0ecc1fd794a47146d3fa033de0a1cada43c458e0cea534' 
	    'SKIP')
package() {
  cd "$srcdir"/gallery_dl-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
