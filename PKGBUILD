# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=1.1
pkgrel=2
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('e4866de2d11606d6cd02acf9135a5ab8')
sha1sums=('cef547802796c8be006ec7db9280e2651e36bee5')
sha512sums=('079310a2a343d05ade0e45d400ddea8ea8f1bf1a5fc2a2abdf61d5e9ee011923472b6ff1264c564c92a208d935e830d45a1abd4effcba7f44b3b094fa82e2c30')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
