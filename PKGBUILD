# Maintainer: A Frederick Christensen <aurlinux@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-caldav
pkgver=0.5.0
pkgrel=1
pkgdesc="a caldav client library"
arch=('any')
url="https://pypi.python.org/pypi/caldav"
license=('GPL')
depends=('python' 'python-lxml' 'python-vobject' 'python-dateutil' 'python-distribute' 'python-six' 'python-requests')
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
  python setup.py install --root="$pkgdir/" --optimize=1
  rm -r "$pkgdir/usr/lib/python3.6/site-packages/tests"
}

# vim:set ts=2 sw=2 et:
