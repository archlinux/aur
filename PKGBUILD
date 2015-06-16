# Maintainer: Mickaël Falck <lastmikoi@lastmikoi.net>
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>, Kevin Zuber <uKev@knet.eu>
pkgname=pidgin-gnome-keyring
pkgver=2.0
pkgrel=2
pkgdesc="Pidgin plugin for Gnome-Keyring integration"
arch=(i686 x86_64)
url="https://github.com/aebrahim/pidgin-gnome-keyring/"
license=("GPLv2")
depends=(pidgin libsecret gnome-keyring)
source=(https://github.com/aebrahim/$pkgname/archive/${pkgver}.tar.gz)
md5sums=('065d5a0c639dcc7466d2f02b6982f75f')

build() {
  cd $srcdir/$pkgname-$pkgver
  echo "$pkgver" > VERSION
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/lib/pidgin
  install -Dm644 gnome-keyring.so $pkgdir/usr/lib/pidgin
}
