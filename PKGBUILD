# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_gitrepo='python-nbxmpp'
pkgname='python-nbxmpp-git'
pkgver=0.6.8.r131.ge83b5d4
pkgrel=1
pkgdesc="Nonblocking Jabber/XMPP library, used by Gajim"
arch=('any')
url="http://hg.gajim.org/python-nbxmpp"
license=('GPL3')
makedepends=('git' 'python')
depends=('python' 'python-precis_i18n' 'python-gobject' 'python-pyopenssl')
conflicts=('python-nbxmpp')
provides=('python-nbxmpp')
source=("git+https://dev.gajim.org/gajim/$_gitrepo.git")
sha384sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitrepo"
  git describe --tags --long | sed 's/^nbxmpp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitrepo"
  python setup.py install --root="$pkgdir/" --optimize=1
}
