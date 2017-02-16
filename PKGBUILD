# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python2-caldav
pkgver=0.5.0
pkgrel=1
pkgdesc="a caldav client library"
arch=('any')
url="https://pypi.python.org/pypi/caldav"
license=('GPL')
depends=('python2' 'python2-lxml' 'python2-vobject' 'python2-dateutil' 'python2-distribute' 'python2-six' 'python2-requests')
options=(!emptydirs)
source=("git+https://github.com/python-caldav/caldav.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/caldav"
  # relase 0.5.0 commit
  git checkout 38c1a4cad6fd3d361cdd7a99905d279727099225
}

package() {
  cd "$srcdir/caldav"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -r "$pkgdir/usr/lib/python2.7/site-packages/tests"
}

# vim:set ts=2 sw=2 et:
