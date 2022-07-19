# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=python-javascripthon
pkgver=0.12
pkgrel=1
pkgdesc="A Python 3 to ES6 Javascript translator "
arch=('any')
url="https://github.com/metapensiero/metapensiero.pj"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-dukpy')
source=("https://github.com/metapensiero/metapensiero.pj/archive/v${pkgver}.tar.gz")
sha512sums=('3a1e2f2cd51e87738f851aa02c53a0be42e73765157451fd1ff7eb292998f0bbe60a209788749491f79945bd0a5f1780b5a2886acdf81153a318f1e69c12328c')

build() {
  cd "$srcdir/metapensiero.pj-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/metapensiero.pj-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
