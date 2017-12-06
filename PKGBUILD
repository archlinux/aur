# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.8.3
pkgrel=2
pkgdesc='A simple TV show episode reminder'
arch=('any')
url=https://github.com/cockroach/episoder
license=('GPL2')
depends=('python-argparse' 'python-requests' 'python-sqlalchemy')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('72c9dd45a2fcfb01ae56885e1d7358de327e5ef63a5d0a788a4509b4de5e26d7')

build() {
  cd $pkgname-$pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgname-$pkgver
  python -m unittest test/*.py
}

package() {
  cd $pkgname-$pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
