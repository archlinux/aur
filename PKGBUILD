#Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgname=nautilus-wipe
pkgver=0.2.1
pkgrel=1
pkgdesc="Nautilus Wipe is an extension for Nautilus for securely erasing files"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('nautilus' 'libgsecuredelete' 'gtk3' 'gconf' )
makedepends=('gnome-doc-utils' 'gconf' 'intltool' 'nautilus')
url="http://wipetools.tuxfamily.org/nautilus-wipe.html"
source=("ftp://download.tuxfamily.org/wipetools/releases/nautilus-wipe/nautilus-wipe-${pkgver}.tar.gz")
md5sums=('2810af83c590a721f9df4de9a0326bd8')
sha256sums=('435e6e0de71a6cdbd11762ac702aa464ba75abd946ffb9074f4f597ded2256ed')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-gtk3
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

