# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=instagram-scraper
pkgver=1.5.23
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('55aace94b15ffdda038906ef97ff9bd6cb7f290e7cc2e8f18c38ad8b4415a120612d1219b6ab43ef2f4f263156afc9bd824bb7834f284ce50f777fba253b83f9')

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
