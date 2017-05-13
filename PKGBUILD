# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.3.2
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-nose' 'python-requests-mock' 'python-tqdm')
makedepends=('python-setuptools')
source=("instagram-scraper-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4ec41590421fe4b63e7b8ccf96282ce2a6996abbebf4eced9bad4768114cac016b7726d0f3f3a7952b9ab4f19bd62a74604bb6dbf09d915b77e63a52728f74dc')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
