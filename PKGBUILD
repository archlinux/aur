pkgname=python2-gertty-git
_gitname='gertty'
pkgver=1.3.2.dev58
pkgrel=1
pkgdesc="console-based interface to the Gerrit Code Review system"
arch=('any')
url='https://pypi.python.org/pypi/gertty'
license=('Apache2')
source=("$_gitname::git://git.openstack.org/openstack/gertty")
sha256sums=('SKIP')
makedepends=('python2' 'python2-setuptools' 'git')
depends=('python2-git' 'python2-sqlalchemy' 'python2-urwid' 'python2-dateutil' 'python2-requests' 'python2-ordereddict' 'python2-alembic' 'python2-yaml' 'python2-ply' 'python2-voluptuous' 'python2-pbr')

pkgver() {
  cd "$srcdir/$_gitname"
  python2 setup.py --version
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root=$pkdir
}
