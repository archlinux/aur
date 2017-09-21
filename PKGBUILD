# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=instagram-scraper
pkgver=1.5.5
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d86b9501b16cf221170c477d99c2a0c9027f702ef4bb199cd910a4b003e1a72a858ed7545df467ab75cd970c787e8c21304dee0cafd9865b1c34b107fe4c8d7e')

check() {
  cd $pkgname-$pkgver
  python setup.py -q nosetests
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
