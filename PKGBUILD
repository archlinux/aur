# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
pkgver=1.1.0
pkgrel=1
pkgdesc="A general-purpose computer algebra system."
arch=('any')
url="https://mathics.github.io/"
license=('GPL3')
depends=('python' 'python-sympy' 'python-django' 'python-mpmath' 'python-numpy'
         'python-palettable' 'python-pint' 'python-dateutil' 'python-llvmlite'
         'python-requests' 'cython')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathics/Mathics/releases/download/$pkgver/Mathics3-$pkgver.tar.gz")
sha256sums=('272b35be879302e0bc5943101c57e7d93d9974050588dca06a03580a5822aa63')

build() {
  cd "${srcdir}/Mathics3-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/Mathics3-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
