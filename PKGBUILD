# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=1.0
pkgrel=1
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('6bd0f95c2aaa0d97544a403cad47a23d')
sha1sums=('eb0158ca349a51a454059ff7ffcc14691b83aa4d')
sha512sums=('e5d7c2563dc5ca53d88cf2fdd24a5c42a9052103990102cc2f2fab58aebf24c01ddc73a470654c2cf60dbc315d8b43946ac2c6959dfacbadc6dfd6832eb695be')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
