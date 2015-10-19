# Maintainer: Benjamin Copeland <ben@copeland.me.uk>

pkgname=conkyclementine-bzr
pkgver=r8
pkgrel=1
pkgdesc="Provides Clementine info, for use in Conky."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~conky-companions/+junk/conkyclementine"
license=('GPL3')
depends=('python2')
makedepends=('bzr')
install=$pkgname.install
source=('bzr+lp:~conky-companions/+junk/conkyclementine')
md5sums=(SKIP)

pkgver() {
  cd conkyclementine
  echo "r$(bzr revno)"
}

build() {
  cd conkyclementine
  python setup.py build || return 1

}

package() {
  cd conkyclementine
  python setup.py install --root=$pkgdir || return 1
  install -D -m644 README $pkgdir/usr/share/conkyclementine/README || return 1
  return 0
}

