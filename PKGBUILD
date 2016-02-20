# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=0.8
pkgrel=3
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('382dfda32a92a679c68ddd40ff2e587e')
sha1sums=('662b7470141c021fcabe196e944eec98ae108d61')
sha512sums=('6f1da84bfca4a8c123e04705f8dcbe4966953b7c43eec5fdc681d9ac5c17546c240744d4e3a34fed72ec7c0d852e3998bad736cd2adbca3a84c2f29902cc0242')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
