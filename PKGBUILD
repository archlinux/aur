# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-watchdog
pkgver=0.8.3
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/watchdog"
license=('Apache')
depends=('python2' 'python2-pathtools')
optdeps=('python2-yaml : for watchmedo script'
         'python2-argh : for watchmedo script')
source=(https://pypi.python.org/packages/source/w/watchdog/watchdog-${pkgver}.tar.gz)
sha256sums=('7e65882adb7746039b6f3876ee174952f8eaaa34491ba34333ddf1fe35de4162')

check() {
  cd "$srcdir/watchdog-$pkgver"
  python2 setup.py test
}

build() {
  cd "$srcdir/watchdog-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/watchdog-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
