# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.4.1
pkgrel=2
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('45f6a8d1b623e01b0176a7a5de76506d4f0ed1729f782220b2bb46c1c3079c6b7a26000bc1c028d14620fbd76276efa14f250fe4474b6b9b7449b4136863c49f')

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
