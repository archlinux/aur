# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.12.1
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
sha512sums=('cca209e6b9f085a045988cea1e4c25609a8073f8ecade0ea2b4e87c29d7c2c0fd86cd74a4dd1ba4d78e2b92ba1cb218234f992c3c7d30804170898850431230b'
	    'SKIP')

prepare(){
  cd gallery_dl-$pkgver
}

package() {
  cd gallery_dl-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
