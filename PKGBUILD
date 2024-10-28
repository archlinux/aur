pkgname=mitogen
pkgver=0.3.15
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

sha1sums=('3b301c0903e5547df8ea71365c47b8378e2342ff')
sha256sums=('5d1df61779db69b63a80de33e4c6c91b3b9e114e9b88f6b6e5ca53da9f4e255c')
sha384sums=('81a1b450c783033d673389f633618660a56101a2f51e5a4ae8e8a3c69fa756cc8f9df688cfe9a819dfe7af22f15a55ad')
sha512sums=('3896ae79427c48f2111da0fd9125af898e2a3bb301d6a5c567cfd108234468dcf257653005f20e3784ffb6f138d8810ba1ec0fbd889619c966e27958630346dd')
