# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.5.3
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1c43b136aa427eb75f44ec6af4cd876a6187b56eb7003083500abd9f51116a2e5b36b6b8ff3e62e4d34b5d3204db86d228a26837b2323c629377d08bd9f8f5e3')

check() {
  cd $pkgname-$pkgver
  python setup.py -q nosetests
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
