pkgname=python2-gertty-git
_gitname='gertty'
pkgver=1.0.3.24.g8c6a110
pkgrel=2
pkgdesc="console-based interface to the Gerrit Code Review system"
arch=('any')
url='https://pypi.python.org/pypi/gertty'
license=('Apache2')
source=("$_gitname::git://git.openstack.org/stackforge/gertty")
sha256sums=('SKIP')
makedepends=('python2' 'python2-setuptools')
depends=('python2-gitpython' 'python2-sqlalchemy' 'python2-urwid' 'python2-dateutil' 'python2-requests' 'python2-ordereddict' 'python2-alembic' 'python2-yaml' 'python2-ply' 'python2-voluptuous' 'python2-pbr')

pkgver() {
  cd "$srcdir/$_gitname"
  python2 setup.py --version
}

package() {
  cd "$srcdir/$_gitname"
  pip2 install . --root=$pkdir
}
