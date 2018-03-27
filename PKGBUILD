# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=instagram-scraper
pkgver=1.5.26
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-requests-mock')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('ea08aee5259028e3a39c73e77ef7680e6ed9b0dece7ded0f14e9c4a04f95afb2e3f4e046f494c89f0abcda7b687c9dfaef61879230bc784cf4de405af1dc47cd')

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
