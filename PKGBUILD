# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Co-maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.14.0
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
sha512sums=('0c4aaf7406a32f7bf507f52037bf15f4477075c9a4089e5f111d11ceddddd724b6cf60a78ff591343ab1cffb7782dea18fb09d280f52412fa42ca231b250adf7'
            'SKIP')

package() {
  cd ${pkgname/-/_}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
