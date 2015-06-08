# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>

pkgname=python2-nbxmpp-hg
pkgver=152.398e3c8055a3
pkgrel=1
pkgdesc="Jabber/XMPP library used by Gajim"
arch=('any')
url="http://hg.gajim.org/python-nbxmpp"
license=('GPL3')
depends=('python2')
makedepends=('mercurial')
conflicts=('python2-nbxmpp')
provides=('python2-nbxmpp=0.5')
_hgrepo=python-nbxmpp
source=("hg+http://hg.gajim.org/${_hgrepo}")
sha384sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_hgrepo}"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

build() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py install --root=$pkgdir
}
