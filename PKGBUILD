pkgname=mitogen
pkgver=0.3.26
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

sha1sums=('b88f51abf010e53ec8d0ea01ea03ea541ec1d318')
sha256sums=('3de2269236933664e6ec5099e5f7c2e5ce664466f2012eabf533fd735862121d')
sha384sums=('a6a73141fb674b132b15258728a13ea522e597b8c3d423966aa92bdaa54c0b86483e888bb62cf3f33bfd929b7b96d442')
sha512sums=('0ee3b73eaf755d8299ddf00d39d58fc47c94b3f2a6b571098639bcf3444a930933f4d09c3310af72aec452427812a27b17a07993099d8775ac4c4f2b7ef92cda')
