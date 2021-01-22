#Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=nautilus-wipe
pkgver=0.3.1
pkgrel=2
pkgdesc="Nautilus Wipe is an extension for Nautilus for securely erasing files"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('nautilus' 'libgsecuredelete' 'gtk3' 'gconf' 'itstool' )
makedepends=('gnome-doc-utils' 'gconf' 'intltool' 'nautilus')
url="http://wipetools.tuxfamily.org/nautilus-wipe.html"
source=("ftp://download.tuxfamily.org/wipetools/releases/nautilus-wipe/nautilus-wipe-${pkgver}.tar.gz")
sha256sums=('a0951375f942a07e637f8bfbc5aa35393e132dffeeab21b4ed61fb586eb517be')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-gtk3
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

