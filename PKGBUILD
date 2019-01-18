# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.6.3
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
sha512sums=('d1d974e39b348d66af3766a57cb225e2fdac7e07ef3109069893b2a1e727ef60e83441af187cc1fb04ca4aacbbf86d8b9932fcba82e5a9c6aa0c1ca69fb04af8'
	    'SKIP')
package() {
  cd "$srcdir"/gallery_dl-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
