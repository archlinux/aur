# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>
pkgname=python-spiceypy
pkgver=2.2.0
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy"
license=('MIT')
makedepends=('python-six>=1.9.0' 'python-numpy>=1.12.0' 'python-certifi>=2017.1.23' 'python-setuptools')
depends=('python-six>=1.9.0' 'python-numpy>=1.12.0' 'python-certifi>=2017.1.23')
optdepends=('python-pytest: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
md5sums=('45578a6d30afa843a6b5edc51b75611a')

build() {
  cd SpiceyPy-$pkgver

  python setup.py build
}

package() {
  cd SpiceyPy-$pkgver

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
