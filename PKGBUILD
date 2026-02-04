pkgname=mitogen
pkgver=0.3.40
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

sha1sums=('a6fa243b13ad12a70e66b2241c7aedf1bcb8a7bf')
sha256sums=('59140a87e281320dd8ce198cb2c21cf25a577e838a02f0cabed34d034a095d3f')
sha384sums=('6c4040b9878db176ae1a618aefdc62b2c7b5d8fd9c188a6a29be19e1566112e629cced8988f96248b959c8dc9a4c835d')
sha512sums=('524db71014f421a9f05f172c7b416d27c89366b403b70338feedd64b8c86551d8120e668fa728172b5f4fe068b297f9cc1f555dca2a75bbbdd3d84ff01151f62')
