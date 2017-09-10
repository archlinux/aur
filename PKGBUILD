# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_gitrepo='python-nbxmpp'
pkgname=('python-nbxmpp-git' 'python2-nbxmpp-git')
pkgver=0.5.6.r24.g9e772a5
pkgrel=1
pkgdesc="Nonblocking Jabber/XMPP library, used by Gajim"
arch=('any')
url="http://hg.gajim.org/python-nbxmpp"
license=('GPL3')
makedepends=('git' 'python' 'python2')
source=("git+https://dev.gajim.org/gajim/$_gitrepo.git")
sha384sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitrepo"
  git describe --tags --long | sed 's/^nbxmpp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-nbxmpp-git() {
  depends=('python')
  conflicts=('python-nbxmpp')
  provides=('python-nbxmpp=0.6')

  cd "$srcdir/$_gitrepo"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-nbxmpp-git() {
  depends=('python2')
  conflicts=('python2-nbxmpp')
  provides=('python2-nbxmpp=0.6')

  cd "$srcdir/$_gitrepo"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
