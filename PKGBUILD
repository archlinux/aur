# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=0.8
pkgrel=1
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('ac58a6c201e26027e0037ce441c775b5')
sha1sums=('5cf23c02714d30158e421132cdda43aa69d8f31c')
sha512sums=('f2f01dc73f8f8ff91cac1f100a1f81db5bc749f9533b12338e8474742bcb752f3a970b04e97572b9a44464ebeb09796f6446d60e7d3e5071a3b8316d3acadc1e')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
