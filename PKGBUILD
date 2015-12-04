# Maintainer: Mark Weiman <mark dot weriman at markzz dot com>

#pkgbase=python-shutilwhich
pkgname=python-shutilwhich
pkgver=1.1.0
pkgrel=1
pkgdesc="Backport of shutil.which"
arch=('any')
license=('custom')
url="https://pypi.python.org/pypi/latex/${pkgver}"
makedepends=('python' 'python-setuptools')
source=("shutilwhich-$pkgver.tar.gz::https://github.com/mbr/shutilwhich/archive/1.1.0.tar.gz")
md5sums=('8a5a43077e8af4d027dfb7b88827022b')

build() {
  cd "$srcdir/shutilwhich-$pkgver"
  python setup.py build
}

package() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/shutilwhich-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

