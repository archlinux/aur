# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
_githubname=gallery_dl
pkgver=1.3.5
pkgrel=1
pkgdesc="Command-line program to download image galleries and collections from pixiv, exhentai, danbooru and more"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
source=(https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz
	https://github.com/mikf/${pkgname}/releases/download/v${pkgver}/${_githubname}-${pkgver}.tar.gz.asc)
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88')
sha512sums=('00de176486a1f90dc704eada913e02debb52a082c01dc74bde4feb207ca83ed200065ab9867eef69b7922ee7f9a64ce10e832dc4d89aecd910819b10db9a90f1'
	    'SKIP')
package() {
  cd "$srcdir"/${_githubname}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
