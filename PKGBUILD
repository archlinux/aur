#Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgname=nautilus-wipe
pkgver=0.3
pkgrel=2
pkgdesc="Nautilus Wipe is an extension for Nautilus for securely erasing files"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('nautilus' 'libgsecuredelete' 'gtk3' 'gconf' 'itstool' )
makedepends=('gnome-doc-utils' 'gconf' 'intltool' 'nautilus')
url="http://wipetools.tuxfamily.org/nautilus-wipe.html"
source=("ftp://download.tuxfamily.org/wipetools/releases/nautilus-wipe/nautilus-wipe-${pkgver}.tar.gz")
sha256sums=('d8a94c2b4e17a6e619bc5da79d45c447f9938f82cf9050f0d46b44a1ea620432')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-gtk3
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

