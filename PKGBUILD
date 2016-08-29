pkgname=python2-gertty
pkgver=1.4.0
pkgrel=1
pkgdesc="console-based interface to the Gerrit Code Review system"
arch=('any')
url='https://pypi.python.org/pypi/gertty'
license=('Apache2')
source=("https://pypi.python.org/packages/9e/ed/dd19a67c287fede452473a685ae3e30dba48a5b280173872450c73a4f94d/gertty-1.4.0.tar.gz")
md5sums=('579416c212dd2bc089f3340d804da8d5')
makedepends=('python2' 'python2-setuptools' 'python2-sphinx')
depends=('python2-git' 'python2-sqlalchemy' 'python2-urwid' 'python2-dateutil' 'python2-requests' 'python2-ordereddict' 'python2-alembic' 'python2-yaml' 'python2-ply' 'python2-voluptuous' 'python2-pbr' 'python2-six')
conflicts=('python2-gertty-git')

package() {
  cd $srcdir/gertty-$pkgver
  python2 setup.py install --root=$pkgdir
  sphinx-build2 -b man doc/source doc/build/man
  gzip doc/build/man/gertty.1
  install -D -m644 doc/build/man/gertty.1.gz $pkgdir/usr/share/man/man1/gertty.1.gz
}
