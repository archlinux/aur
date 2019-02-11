pkgname=mitogen
pkgver=0.2.4
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.readthedocs.io/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/dw/mitogen/archive/v${pkgver}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('45b42d34a777401ff5d94779167ed5d4')
sha1sums=('a44e010bdb14eebe0069e2e7f603a2d2d0ee7d3b')
sha256sums=('14bddb041f39ba17062713909a5267cb669f6b5fdbe1b5d8232833d7e9268da0')
sha384sums=('ce2dd41c445e5141b992dd496fb70eeb860c4cb3a5df8984c95564c732240943e0b469dcb753d9f605efa28056bf7147')
sha512sums=('f17a9481678019bb054bf27c4bad74145d6a3dbbb1665cd380c2f372f44e17df4b5017f836244d7f4ed69c6d85bfce7af798bfda38997f3d00dac78e4eb9eb69')
