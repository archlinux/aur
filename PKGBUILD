# Maintainer: Benjamin Winger <winger.benjamin@gmail.com>

pkgname=snappers
pkgver=1.1.8
pkgrel=2
pkgdesc="A set of supplementary commands to be used with snapper"
provides=('snappers')
conflicts=('snappers')
arch=(any)
url="http://pypi.python.org/pypi/snapperS/"
license=(GPL2)
depends=('snapper' 'python-tabulate')
makedepends=("python")
source=('https://files.pythonhosted.org/packages/8f/96/24c82ef8988b2af95ac5b458e5cfad819c5ae948cec9960287f67dd95349/snapperS-1.1.8.tar.gz')
sha512sums=('30952f4a49459affd23cab5b5836b4afd60645db6b2f99e9736d72e513d32c6c4e66b21576ca933481b96be760f797bba205521adde2c69274bd429e0054902b')

prepare() {
  cd $srcdir/snapperS-$pkgver
  2to3 -wn snapperS/snapperS
}

package() {
  cd $srcdir/snapperS-$pkgver
  python setup.py install --root $pkgdir --optimize=1
}
