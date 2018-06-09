# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
_githubname=gallery_dl
pkgver=1.4.0
pkgrel=1
pkgdesc="Command-line program to download image galleries and collections from pixiv, exhentai, danbooru and more"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz
	https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz.asc)
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha512sums=('187d191d55039f4a25a24cc78ec6ab9ad0260b1199d4aac1860d0c0209173094e66cddcb88998143f5a98e138277271cb132debfac32dbd296bb6d930948b183'
	    'SKIP')
package() {
  cd "$srcdir"/${_githubname}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
