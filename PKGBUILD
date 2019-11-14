# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.11.1
pkgrel=2
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
sha512sums=('7e9c4ea91b7364f2fc43408f9f3e268377e23958a2acd6f51015f2a79da6f67fb6a0c5885873a0b4b47cca1f1c02e9d8ef3f2bd1a97fbca420d8d0eb4054c458'
	    'SKIP')

prepare(){
  cd gallery_dl-$pkgver
}

package() {
  cd gallery_dl-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
