pkgname=mitogen
pkgver=0.3.38
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

sha1sums=('e874ad4080c0746aee34d41552221de127e103ee')
sha256sums=('bb11268a8b0b576c304f1b5985a0403148a3cc399c35324ac726648fd38c60dd')
sha384sums=('16c37a2597245e698ba7fee862f807bc9cbdde6b1fbcdbbd0f9f1004fd9efe0d8c5db7e0bb2e5906ad15d354195b7bf9')
sha512sums=('d1f86b7a5691cd6493d220398c6771a0a23baf24c32ad978e935750496d4cfc2dc2e1657f9c65f9111894c37c6658581fc4a07b1b9e37bfa5aaeac7829f388b1')
