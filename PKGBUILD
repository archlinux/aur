# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('python-fasteners')
pkgver=0.14.1
pkgrel=4
pkgdesc="A python package that provides useful locks."
arch=('any')
url="https://github.com/harlowja/fasteners"
license=('Apache')
makedepends=('python-setuptools')
depends=('python-six' 'python-monotonic')
source=(https://github.com/harlowja/fasteners/archive/$pkgver.tar.gz)
sha512sums=('954d692b7f43563ba1413854c8dec2f5ff98757346c55aaa5f39e9aa777fb746bf4f9506beab6cfa149d5646db4b3de58d35bcef95e3128096c3346c9fd8015c')

build() {
  cd "$srcdir/fasteners-$pkgver"
  python setup.py build
}

package_python-fasteners() {
  cd "$srcdir/fasteners-$pkgver"
  python setup.py install --optimize=1 --root=${pkgdir}
}
