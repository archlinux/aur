# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-watchdog
pkgver=0.8.3
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/watchdog"
license=('Apache')
depends=('python' 'python-yaml' 'python-argh' 'python-pathtools')
source=(https://pypi.python.org/packages/source/w/watchdog/watchdog-${pkgver}.tar.gz)

build() {
  cd "$srcdir/watchdog-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/watchdog-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
md5sums=('bb16926bccc98eae2a04535e4512ddf1')
