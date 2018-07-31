# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=instalooter
pkgver=2.1.0
pkgrel=1
pkgdesc='Another API-less Instagram pictures and videos downloader'
arch=('any')
url=https://github.com/althonos/InstaLooter
license=('GPL3')
depends=('python-coloredlogs' 'python-dateutil' 'python-docopt'
         'python-fake-useragent' 'python-fs' 'python-requests' 'python-six'
         'python-tenacity' 'python-tqdm' 'python-verboselogs')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('5c91bdc84bf3b6d2f5c0e936ff44bd67ecf787a588bd1865e43cb73bdedb2473695ca5d7318f58f9b7cd57ca54b85df15c0b991ce05a75be571512afbe627fd9')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
