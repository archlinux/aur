# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
_githubname=gallery_dl
pkgver=1.5.1
pkgrel=1
pkgdesc="Command-line program to download image galleries and collections from pixiv, exhentai, danbooru and more"
arch=('x86_64')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'zip: Store downloaded files in a ZIP archive')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz
	https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz.asc)
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha512sums=('ed9b815f59cc8e1df2127c51ba891f4126caea7165b0c99af79736e10cde7820c19a9575716e6ae161e2aae5da9561ff535ed903023bca905a50f9fc52af3dbb'
	    'SKIP')
package() {
  cd "$srcdir"/${_githubname}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
