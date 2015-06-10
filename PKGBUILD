# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-watchdog
pkgver=0.8.1
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/watchdog"
license=('Apache')
depends=('python2' 'python2-yaml' 'python2-argh' 'python2-pathtools')
source=(https://pypi.python.org/packages/source/w/watchdog/watchdog-${pkgver}.tar.gz)

build() {
  cd "$srcdir/watchdog-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/watchdog-$pkgver"
  python2 setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
md5sums=('a58a082823dc6d3c60ffba1ff5f94608')
