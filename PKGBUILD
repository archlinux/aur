# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.4.2
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1c9b13a3bab129690b9294da9dbce30bdbaa80882dfd7e07d98fa6f68ece29900af8a6e6b4a81c0b2d2cec03288a1e7f5090a5f34c48d5136f7873104aa14dab')

prepare() {
  cd $pkgname-$pkgver
  sed -i '7,8d' setup.py # https://github.com/rarcega/instagram-scraper/pull/72
}

check() {
  cd $pkgname-$pkgver
  python setup.py test
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
