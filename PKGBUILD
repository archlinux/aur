# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Co-maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.13.6
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
sha512sums=('a1ff1c2d7ba4b79e163e38a4e73a4059fb7696e682569d7b5f7b956c926aaf51fade1a4ce03466f94fd6b39df0c9c458ced139289e98029595f51b757d1509a6'
            'SKIP')

package() {
  cd ${pkgname/-/_}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
