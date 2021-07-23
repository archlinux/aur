# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>
# Former Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=instagram-scraper
pkgver=1.10.0
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/arc298/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('ef2fe9871920cfa05724cf3d31ddef47884aa5865d68c19c6daf91e25a7c421f017d87424867353a2c73870c55b3db3236520a712622d3c2423b1731fc421eb9')


build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
