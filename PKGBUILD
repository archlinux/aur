# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=1.0
pkgrel=2
pkgdesc="Purple (Pidgin / Finch) plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(libsecret libpurple gnome-keyring)
install=$pkgname.install
source=(https://github.com/GRBurst/$pkgname/archive/v${pkgver}.${pkgrel}.tar.gz)
md5sums=('a9a97cdca9f37958252bc1c56fbae56b')
sha1sums=('19ad020799d7f275e5c283abd589e762443e588c')
sha512sums=('300594e215d6af67c40ec864a0695395eff13e3bc02f57a7c5870c7fdaeec1c312a3e0713d1dccc9c0cae269a8bfe42e83ef29e5f041af5092a8f3cf516a9fb0')

build() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver.${pkgrel}
  mkdir -p $pkgdir/usr/lib/purple-2
  install -Dm655 $pkgname.so $pkgdir/usr/lib/purple-2
}
