pkgname=pidgin-jabber-pseudo-invisibility
pkgver=0.4.2
pkgrel=1
pkgdesc="Adds a Pseudo Invisible status to all Jabber/XMPP accounts"
url="http://www.siorarina.net/jabber-pseudo-invisibility/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'pidgin')
makedepends=('intltool')
source=("http://www.siorarina.net/jpi/src/jabber-pseudo-invisibility-${pkgver}.src.tar.gz")
sha256sums=('bb9450d5b0e30f510bb9842d690ff29b2f4c26b3204efbe131c29bfca511be8e')

build() {
  cd "${srcdir}/jabber-pseudo-invisibility-${pkgver}"

  make || return 1
}

package() {
  cd "${srcdir}/jabber-pseudo-invisibility-${pkgver}"

  install -Dm755 jabber-pseudo-invisibility.so "$pkgdir/usr/lib/purple-2/jabber-pseudo-invisibility.so"
}
