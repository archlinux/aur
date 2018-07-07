# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
_githubname=gallery_dl
pkgver=1.4.2
pkgrel=1
pkgdesc="Command-line program to download image galleries and collections from pixiv, exhentai, danbooru and more"
arch=('x86_64')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz
	https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz.asc)
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha512sums=('495edce2da77202923c92369838a852ef6c90a31fab4cccb37701187c27f0667c0b3737b1367d74503c7f33e61504b425e9cc1dc85e3d123943bdc6aa1ec5b2b'
	    'SKIP')
package() {
  cd "$srcdir"/${_githubname}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
