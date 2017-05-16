# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.3.3
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-nose' 'python-requests-mock' 'python-tqdm')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d1178e4dbf7a11d22b896d2524475b9204f3c21a5f26065c06b5bd8eb09200dcbba78c5a8e7b02c5bcb7bb015da96e78899c235b4233e4da1829d7e0be679953')

check() {
  cd $pkgname-$pkgver
  python setup.py test
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
