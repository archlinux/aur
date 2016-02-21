# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=0.9
pkgrel=1
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('ad3ac68f0c2285ddb067acb768dc00d7')
sha1sums=('718025f9c37ce835d6f0d7bf6920fabd54c1479c')
sha512sums=('31a3eb1437328f9eb488cf6e66a7aec4dd859af8203bb16afc70f9a9401c245d2b222959c62660f0c47a3fdaa08b7ec496cde86619af172f241f5a7ab8f85649')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
