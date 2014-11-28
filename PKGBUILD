# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=dclib
pkgver=0.3.23
pkgrel=1
pkgdesc="Libraries for the Direct Connect 4 Linux (Valknut) File Sharing program."
license=('GPL')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wxdcgui/"
depends=('openssl' 'bzip2' 'libxml2' 'libstdc++5')
source=(http://downloads.sourceforge.net/sourceforge/wxdcgui/$pkgname-$pkgver.tar.bz2)

md5sums=('6852e420e48d09b514fcb9f783611cdc')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install
}
