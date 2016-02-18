# Maintainer: Julius Elias <JuliusE89@gmail.com>
pkgname=purple-gnome-keyring
pkgver=0.7
pkgrel=1
pkgdesc="Purple / Pidgin plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/GRBurst/purple-gnome-keyring/"
license=("GPLv3")
depends=(pidgin libsecret gnome-keyring)
source=(https://github.com/GRBurst/$pkgname/archive/${pkgver}.tar.gz)
md5sums=('680d9b303fb25b756d005f854caffc17')
sha1sums=('31d1568f03c290c20693e12a39d4eec1fb0894fb')
sha512sums=('2823ac3fa3c052fafe2b940be42cf5a16ec84747d494002cf2faef4c9d9206f4f54942da4f32014b2f31ed15ffcb463ee315df691d86e3bc296b5ef27d685231')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/lib/pidgin
  install -Dm644 gnome-keyring.so $pkgdir/usr/lib/pidgin
}
