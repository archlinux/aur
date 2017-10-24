# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=('python-spiceypy')
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy"
license=('MIT')
makedepends=('python-six>=1.9.0' 'python-numpy>=1.8.0' 'python-setuptools')
source=("https://github.com/andrewannex/spiceypy/archive/v${pkgver}.tar.gz")
md5sums=('7115d8c054e46b21c85863bd42de0a3d')

build() {
  echo "Building Python3"
  cd SpiceyPy-$pkgver
  python setup.py build
}

package_python-spiceypy() {
  depends=('python-six>=1.9.0' 'python-numpy>=1.8.0')
  optdepends=('python-pytest>=2.9.0: testing')

  cd SpiceyPy-$pkgver

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
