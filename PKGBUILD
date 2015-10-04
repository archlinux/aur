# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Gerhard Brauer <gerhard.brauer@web.de>
# Contributor: Aitor <aitor.iturri@gmail.com>

pkgname=libcdk
pkgver=5.0.20150928
pkgrel=1
pkgdesc='Curses Development Kit - widget library, enhanced version'
arch=('x86_64' 'i686')
url='http://invisible-island.net/cdk/'
license=('custom')
options=('!emptydirs')
source=('http://invisible-island.net/datafiles/release/cdk.tar.gz')
sha256sums=('028da75d5f777a1c4184f88e34918bd273bd83bbe3c959bc11710c4f0ea2e448')

build() {
  cd "cdk-${pkgver:0:3}-${pkgver:4}"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "cdk-${pkgver:0:3}-${pkgver:4}"

  make DOCUMENT_DIR="$pkgdir/usr/share/doc/cdk" DESTDIR="$pkgdir" install \
    installCDKSHLibrary
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
