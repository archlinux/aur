# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=instagram-scraper
pkgver=1.5.19
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('172653f1bef24d44a60367b9a6e6a46c9ae3365be5c504832ae367bd2beb2dc102a522d79dd3fda58ca8b624b1c9524372bbc42236af854e7a298a456931561a')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  nosetests
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
