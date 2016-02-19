# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=0.8
pkgrel=2
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('e08cddcbb1731229ecb3a9c6d3cb3ec4')
sha1sums=('dd84b0d629f00573fb941fe3599787c4c490ac37')
sha512sums=('fae348eb07ffb4f0b22d9a1a39cfc6c035ecf039cafa0c286c43c7773ceb37912a43175403601d532d49e7d41bc7a03ef5c5930f485e110800a3f459c15c3d2c')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
