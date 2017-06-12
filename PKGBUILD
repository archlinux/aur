# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.4.0
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-nose' 'python-requests-mock' 'python-tqdm')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('820b3957edc4f13b22418e8ae5cfd1115c2d73bd745b8f1828e0a460310c8f73a34c53711a3f74497eb964dba37b8fb5cf50d1e5c7c32682b5b6dcde588fb057')

check() {
  cd $pkgname-$pkgver
  python setup.py test
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
