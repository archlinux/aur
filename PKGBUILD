# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=1.1
pkgrel=1
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('9e776ca08e47bf6765125d98d0b58da5')
sha1sums=('52d69e54ab4c1a9befbd28e17bd857fda44cdde1')
sha512sums=('4d5876c84dc271115513bd500a9ff5e7812588d4809cddd47fa65809e3d4addbba6ce83276341c926901ce8abf105413f353a02e3adb4b085f45d627cfc91385')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
