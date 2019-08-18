pkgname=mitogen
pkgver=0.2.8
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.networkgenomics.com/"
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

md5sums=('fb530685fb32184689de82735c4d68a7')
sha1sums=('5e1804f6edcbfda7cbbb863ddfd6154a09f6a1af')
sha256sums=('95b90b786ec09490e8a748394da36b442d9647ed754a1d7924fdefd2b904c6d4')
sha384sums=('e155be0d248c9abd027561a48d19d1e4a73eb1229f199581209fc30441c8ed950fc1adbee4ce2b5fb5081960405a019f')
sha512sums=('0c1f37fe60dd6be987f1be3d9888e1b58c61a98dfa88a22400817c9a31723456c6f47bf96da36335f049cc2f4c87af2c69ef03699c1a43bbf13557927620e688')
