# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: detto <detto-brumm@freenet.de>

pkgname=pidgin-hotkeys
pkgver=0.2.4
pkgrel=3
pkgdesc="A Pidgin plugin that allows you to define global hotkeys."
arch=('x86_64')
url="http://pidgin-hotkeys.sourceforge.net"
license=('GPL')
depends=('pidgin')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "pidgin-hotkeys.patch")
md5sums=('553aae7319861af9e8716bfe0ba45c30'
         '0726353af56270164d7af88470722dd0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np0 -i ../pidgin-hotkeys.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
