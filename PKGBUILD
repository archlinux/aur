pkgname=mitogen
pkgver=0.3.54
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

sha1sums=('da57ed2e683d46856f495f050df063146bb7fb69')
sha256sums=('70bbbd504d50ceaccb8739f397b6553686855911712ddc3c564c8ef591ed0503')
sha384sums=('8da352ddd54397fe280e92930975db1ab434002465c22bcb5135b7a0f73fc5b7b72c179a11b230f6f3f11164e2d60ea7')
sha512sums=('130853648c4a110bf311530e22fd664c03d9d0f66c84ba00f40df02d99239490be161cdc7a064dbbd10c6c199e4c5e2fbe61ec25a8a5f7d646f44599174b9acc')
