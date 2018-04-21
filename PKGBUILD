# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
_githubname=gallery_dl
pkgver=1.3.4
pkgrel=1
pkgdesc="Command-line program to download image galleries and collections from pixiv, exhentai, danbooru and more"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz
	https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz.asc)
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha512sums=('57f73c0b977663106ed97fbc6806026e9fdd3154bb4b9153b083c7bcc6ce3c876df3a2f60ac3b9cbf44fbde64851e393128474044f619e5ef3c392a48af51a76'
	    'SKIP')
package() {
  cd "$srcdir"/${_githubname}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
