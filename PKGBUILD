# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.3.1
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-nose' 'python-requests-mock' 'python-tqdm')
makedepends=('python-setuptools')
source=("instagram-scraper-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cf542be9059895ae5364b3a98a24c5e4d1d306e36119bf4b792324c9ac5112f702259f78b4d593e3f69851137093d8c17f1b72908c18d677653d17b3ba061330')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
