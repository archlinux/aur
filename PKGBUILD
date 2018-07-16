pkgname=mitogen
pkgver=0.2.1
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.readthedocs.io/"
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

md5sums=('c3421b0d59321bb1e821655dfdf5155c')
sha1sums=('11b60d71f1b6f70de130dd99b07d1193f7b96e7e')
sha256sums=('2d71a1bd210509f66dfa82c8cf09aadeaca2356703db15b7df6e7901657bf8cf')
sha384sums=('eeeb8725e65b3ffe65d167f0271bbe29884fdff55aff83022c9bf8e3f28d14be8b9e8f49a375fb3a987346376538a898')
sha512sums=('235fa753e1d4903f0b0628f583e37899c5d640062c5357e4ce95bf784dac119853262305e46daedd66e9e014afccb74f00c23f23a8213991bd6c597ad750f78b')
