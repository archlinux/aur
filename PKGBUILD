# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=instalooter
pkgver=2.3.1
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
sha512sums=('9479ae621cd4c40a350747e2f162b87866f819bbf1a66f3f22ea9d437e57c2717ee0e3da475356f685a20185aa838eb443967f2ebdddd76a2869ea6cf9fcd357')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
