# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Co-maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.13.5
pkgrel=1
pkgdesc="Command-line program to download image-galleries and collections from several image hosting sites"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python-setuptools')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'youtube-dl: Download videos')
source=("$url"/releases/download/v"${pkgver}"/"${pkgname/-/_}"-"${pkgver}".tar.gz{,.asc})
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88') #Mike Fährmann
sha512sums=('a9fbf91a8371daa558f8a88317e655a71e46baeb7178859475f15d87b9ca65ac06b18ffb7b23aeac5b68a38341071e962d877a0c61c072b6c259634dd3f8f9cf'
            'SKIP')

package() {
  cd ${pkgname/-/_}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
