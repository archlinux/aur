# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_dashboard
_name=trytond_dashboard
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgdesc="Tryton module for dashboard"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bb1f895ef6bb464f7a1bd3983a2f2d16bad9aaf9ec8c89936d5922e1b3c4cc4e
1bf217ddc47013ad9a8089b4a967d3723de9497edd0b8cf7e5369d1db85ea4ce')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
