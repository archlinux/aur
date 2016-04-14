# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_hgrepo='python-nbxmpp'
pkgname=('python-nbxmpp-hg' 'python2-nbxmpp-hg')
pkgver=165.52ba62dfad93
pkgrel=1
pkgdesc="Nonblocking Jabber/XMPP library, used by Gajim"
arch=('any')
url="http://hg.gajim.org/python-nbxmpp"
license=('GPL3')
makedepends=('mercurial')
source=("hg+http://hg.gajim.org/$_hgrepo")
sha384sums=('SKIP')

pkgver() {
  cd "$srcdir/$_hgrepo"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

package_python-nbxmpp-hg() {
  depends=('python')
  conflicts=('python-nbxmpp')
  provides=('python-nbxmpp=0.6')

  cd "$srcdir/$_hgrepo"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-nbxmpp-hg() {
  depends=('python2')
  conflicts=('python2-nbxmpp')
  provides=('python2-nbxmpp=0.6')

  cd "$srcdir/$_hgrepo"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
