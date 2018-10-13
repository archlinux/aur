# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gmailieer
pkgver=0.10
pkgrel=1
pkgdesc='Fast fetch and two-way tag synchronization between notmuch and GMail'
arch=('any')
url=https://github.com/gauteh/gmailieer
license=('GPL3')
depends=('python-oauth2client' 'python-google-api-python-client' 'python-tqdm')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9663799f9896dc48568febe00a7fb272b0176a86add680f5d5c9539c833aa6b471d0f5de9b644e9103191a6c85df6dbdcd64c55433ef573b37c837402de63c4c')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
