# Maintainer:
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Geraud Le Falher <daureg@gmail.com>

_pkgname="log4cpp"
pkgname="$_pkgname"
pkgver=1.1.6
pkgrel=1
pkgdesc="A library of C++ classes for flexible logging to files, syslog, IDSA and other destinations"
url="http://log4cpp.sourceforge.net/"
license=('LGPL-2.1-only')
arch=('x86_64')

depends=('libnsl')

_pkgsrc="$_pkgname"
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a036bc6bd6044479e6c456de7edd042b060ea5c843e47beb75f59baea9b20e3a')

build() {
  cd "$_pkgsrc"
  ./configure --prefix=/usr --disable-doxygen --disable-dot --without-idsa
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
