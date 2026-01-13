pkgname=mitogen
pkgver=0.3.37
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

sha1sums=('d229a84cad3f0ee5f03ee8fb436a05801ea5a3d7')
sha256sums=('fce9b47a8eb155d389aa0e4bc820d1fdd8f512563b831933896b3eb0ec8e573f')
sha384sums=('1a9849965b51a8c9029e32dcc86e3658442cecf653e487271a21823dcd36a91aaf7b00c0fcaf57cd30ee6e940cc91750')
sha512sums=('c0f99c119e8b48c6b928155c0f6ac20a604a06d3587280bbcfeac91bde480ba77053c67e5cf842493e4c6179096af369d85c31b01d1b08df8f40fc79b997e019')
