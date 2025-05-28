pkgname=mitogen
pkgver=0.3.23
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

sha1sums=('2aa5af99d0125956bef11a47514af0b1599eb4e5')
sha256sums=('5e7b5d0bb951da12648e5512bdd0f7d9fdbd30596361fdccb85987ff11b4af76')
sha384sums=('18b20c91bd2590341ee1454cc3cda8f992da1ec24428488d09b20787de7dcd9dd357d6117ad871b28e194683dfdf4e14')
sha512sums=('3ee737caddbff273331a66d39645ef0d57d8940649a6025d2d46b24c20fec94f504ad9539e9deb6ed096ba11ec595acebe21a2f955538ffa2ab899da51cb2edd')
