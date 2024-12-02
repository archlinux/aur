pkgname=mitogen
pkgver=0.3.19
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

sha1sums=('ca3eb2f7b95833fc5a015aa943ef89efc3c5b5e0')
sha256sums=('90dbf0cc7a408e2c092346be8d1eb94c1ce77bbbe6506e0a6c8076608e7afc35')
sha384sums=('9f28a2b6887e01989d86a2a7112c4c3727daffc5ca2d7ff1a7be38d156f36e370b369cb67f034e02ec3582de27fcf291')
sha512sums=('5508855eab1ba6d16feaea92147b87c7621c2987a30e46e360cd325d59f15003a5a6225aa94d6d43e57db162067a306b7a0e33dc271fe75d4d97e488bb273b64')
