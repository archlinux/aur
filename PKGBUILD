pkgname=mitogen
pkgver=0.3.24
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

sha1sums=('47f2fbf04e6fb6ba9cad48aa371455d1e68f4b57')
sha256sums=('27cdfe5f0ef2a1998786efd0371e613d7554fc272ec6575e92e021bbe2844558')
sha384sums=('e55639b4f5d97d7d84160423d3e87e4cc6fe03b1e64a8d06a58bbae84b7ff671d22e927953457bd5bd27baf1dccc9fa2')
sha512sums=('aa920515a442c4656f38f1ff42084eca0694f5f8ff8300939506648c2fd68a60b935a31143b2c287f182a26066acb3b9432cfbe06301113e6667e50b0f2e5483')
