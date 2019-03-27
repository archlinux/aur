# Maintainer:
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Gicu Gorodenco <cyclopsihus@gmail.com>
# Contributor: MaLiK <malik_cjm@o2.pl>
# Contributor: dpevp <daniel.plaza.espi@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Anthony <anthony@littlegno.me>

pkgname=pidgin-sipe
pkgver=1.24.0
pkgrel=1
pkgdesc="Third-party Pidgin plugin for Microsoft Office 365/Lync/LCS/OCS"
arch=('x86_64')
license=('GPL2')
url="https://sipe.sourceforge.net/"
depends=('gmime' 'libpurple')
makedepends=('intltool')
optdepends=('krb5: Kerberos support')
source=(https://downloads.sourceforge.net/project/sipe/sipe/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('b88a1ed45cb876d0ff5b0e8151767f1d')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-telepathy

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
