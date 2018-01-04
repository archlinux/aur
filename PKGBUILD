# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=('python-spiceypy')
pkgver=2.1.0
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy"
license=('MIT')
makedepends=('python-six>=1.9.0' 'python-numpy>=1.8.0' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
md5sums=('be29fd2060b5a61f9f3e271835e82022')

build() {
  echo "Building Python3"
  cd SpiceyPy-$pkgver
  python setup.py build
}

package() {
  depends=('python-six>=1.9.0' 'python-numpy>=1.8.0' 'python-certifi>=2017.1.23')
  optdepends=('python-pytest>=2.9.0: testing')

  cd SpiceyPy-$pkgver

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
