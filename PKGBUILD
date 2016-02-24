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
md5sums=('80aa1da26dec2743ac4e899d7829dbe2')
sha1sums=('f3652c72a9d7f5923977efe02f9afde496817969')
sha512sums=('0ca8ec7d4b92b888364e8fcab34a90705ba33ec04d16e71491af993d48bc331500fa560e527ebe65d79d018d2bda56db932b50b05b54d3713bb96f2be9636c4c')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
