pkgname=mitogen
pkgver=0.3.41
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

sha1sums=('08c50b61e44a7ba2b6b3468b6ea75fffc050fb51')
sha256sums=('6233a31b804c16336d82cc34eafff61cb181756993f6cadd9862e27992b28fa4')
sha384sums=('2022a7b55df45910fd49d133204bb0097ed198924246481e8402dda01570f2b74da077ac7498ddf1929017f261f79646')
sha512sums=('4be91a3fe9ae0b8433945f8479e8c6878961d545de8b21fc683ae340166a06e820242afcceccc27ff585e33b245afb720930f08a7aefbc5fa4d7dfdc9588e06b')
