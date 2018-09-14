# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.5.3
pkgrel=1
pkgdesc="Command-line program to download image galleries and collections from pixiv, exhentai, danbooru and more"
arch=('x86_64')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'zip: Store downloaded files in a ZIP archive')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/gallery_dl-${pkgver}.tar.gz
	https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/gallery_dl-${pkgver}.tar.gz.asc)
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha512sums=('8a740d69980967d36223cb24fe6333c8eae689ee2f729e6c8f19eb4a729c5f6c197bf5586d8b4e13931970d54b8572bbd9d041d25dc47cd6b03d596351738d24'
	    'SKIP')
package() {
  cd "$srcdir"/gallery_dl-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
