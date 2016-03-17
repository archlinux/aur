# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Gerhard Brauer <gerhard.brauer@web.de>
# Contributor: Aitor <aitor.iturri@gmail.com>

pkgname=libcdk
pkgver=5.0.20160131
pkgrel=1
pkgdesc='Curses Development Kit - widget library, enhanced version'
arch=('x86_64' 'i686')
url='http://invisible-island.net/cdk/'
license=('custom')
options=('!emptydirs')
source=('http://invisible-island.net/datafiles/release/cdk.tar.gz')
sha256sums=('c32d075806c231b96ca3778bd24132c7aa0ba9a126f3cebb8a16c59a8b132c22')

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
