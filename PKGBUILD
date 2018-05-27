# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=instalooter
pkgver=2.0.2
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
sha512sums=('1c38fa3bbf017ebb7510b52c67f35adbcdf8410be1d1870a064fada0e1e113b3f67afafe55f76d83307008801f458a0dd0f5be7f39d8840b89bee8012bfe5b76')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
