pkgname=mitogen
pkgver=0.3.50
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD-3-Clause")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('5dd35484f7a76c9f19e7cd2f709103e677fde761')
sha256sums=('e26391645f9aa615b78c4d4f2c3cd1f570d11b29fb16e6e771a77d8235369718')
sha384sums=('213b4edb6402aac0b15a1b7583f2c533edac6f587ae28dddd3ff30adbd36a1dccb4672e4a6af7795ea458478de93bbcf')
sha512sums=('c104480d31e74b8aa9dfcbc836a5ed75ff3dd5fbac206c1724fa5334fe2d6f9e45b08ffb9bc1bd0d4e3de91f58047f147749c270a34f90aee6470be76d2c7969')
