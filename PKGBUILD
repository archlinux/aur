# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=1.1
pkgrel=3
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('4d4a5de5946506d1693ac241ef5d4beb')
sha1sums=('2534a6c8fbe15fad34ae304d12c2dead2763c487')
sha512sums=('cb98739bc132b146f10874bef01d8994c545152dd53fcba7af69570524018574a38eebb8b170b24d12044bd72011195352ff914f10177b754ac721742fc2731d')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
