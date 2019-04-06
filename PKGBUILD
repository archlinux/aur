# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>
# Former Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=instagram-scraper
pkgver=1.6.0
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('58148f2e6e7281dc79038ac874559d3665b9ed7b841005c8e1cbbc04af04d0bb0c47ced540e33ce70a45cac0e928dd6360aaa4b8194918cebb6ef8856fed2f60')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
