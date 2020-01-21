# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.12.3
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
sha512sums=('d06e17d88daccb5822a5c8684309d633b0bf6680c1cf0c2c482079fa5a3ae1a9524a22190231e4e03ddb708b437e2a1d57a7b728cf971f10de1ddf144f393fd2'
	    'SKIP')

prepare(){
  cd gallery_dl-$pkgver
}

package() {
  cd gallery_dl-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
