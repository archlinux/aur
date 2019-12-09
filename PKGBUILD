# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.12.0
pkgrel=1
pkgdesc="Command-line program to download image-galleries and collections from several image hosting sites"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'youtube-dl: Download videos')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/gallery_dl-${pkgver}.tar.gz{,.asc})
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88') #Mike Fährmann
sha512sums=('2fca87ca6a4be03421ecba15bf0157bdd577d3e74e8c7f757a18a4ebbefda898070c0c5d42087c190b79305681e3ff28b0cde0b3700844486870da36deb878eb'
	    'SKIP')

prepare(){
  cd gallery_dl-$pkgver
}

package() {
  cd gallery_dl-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
