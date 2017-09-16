# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.5.4
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6d6993b4e97fd11c39f5d1ace604dc28cb21c4479f476641fd8538711939f94692fdce38a02d833d60ddece0ece908cc90c20a5b8901a801451eff85776e57fa')

check() {
  cd $pkgname-$pkgver
  python setup.py -q nosetests
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
