# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Zafer "xaph" CAKMAK <mzcakmak [at] gmail.com>

pkgname=pidgin-cmds
pkgver=0.2.0
pkgrel=2
pkgdesc="Simple Shout plugin on pidgin"
arch=('x86_64' 'i686')
url="http://code.google.com/p/pidgin-cmds/"
license=('GPL')
depends=('pidgin' 'glib2')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pidgin-cmds/pidgin-cmds-${pkgver}.tar.bz2")
sha256sums=('92deee46d45d03c79fb02caa5680b4742c80d56b93a0184aa2afca05cbe265db')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
