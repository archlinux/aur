# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-iowait
pkgver=0.2
pkgrel=1
pkgdesc="Platform-independent module for I/O completion events"
arch=('any')
url="https://launchpad.net/python-iowait"
license=('LGPL')
depends=('python')
makedepends=('python-distribute')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/i/iowait/iowait-${pkgver}.tar.gz")
md5sums=('f49ca7766fe4a67e03a731e575614f87')

build() {
  cd "$srcdir"/iowait-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/iowait-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1
}
