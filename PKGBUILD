# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.3.0
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-nose' 'python-requests-mock' 'python-tqdm')
makedepends=('python-setuptools')
source=("instagram-scraper-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('139b9dce038d84ab63e6556cab6e284d132e20622255313c4c635a2143fde916cbae3c1e886a6908360a6a1d3b1dc03ff5609f54e33d1ef81b12b2023ba93e4f')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
