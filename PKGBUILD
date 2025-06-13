# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib
_name=pycdlib
pkgver=1.15.0
pkgrel=1
pkgdesc='parse, write, and create ISO9660 and UDF image'
arch=('any')
url=https://github.com/clalancette/pycdlib
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('200ded591a60d7cf82b4715b93952da5d26562e787fbd14b0eef487a1fe136c42ebcee92d6089ab6852996fe5834af09d1423257a911f808862b2adcf35cb26c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
