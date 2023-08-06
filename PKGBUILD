# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

pkgname=python-mechanicalsoup
pkgver=1.3.0
pkgrel=1
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=(python python-beautifulsoup4 python-requests python-six python-lxml)
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")

check() {
  cd $srcdir/MechanicalSoup-$pkgver 
  python3 -m build --wheel --no-isolation
}

package() {
  cd $srcdir/MechanicalSoup-$pkgver 

  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha512sums=('68b0ef14e4395b7a97461c5730909e449c1edba9f223efd8066b0e227f28032497eaef84263bd88a82c5b3fa3f1e291eccf483bea7358e4c255f9f6346f5b47a')
