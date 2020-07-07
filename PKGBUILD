# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: detto <detto-brumm@freenet.de>

pkgname=pidgin-hotkeys
pkgver=0.2.4
pkgrel=5
pkgdesc="A Pidgin plugin that allows you to define global hotkeys."
arch=('x86_64')
url="http://pidgin-hotkeys.sourceforge.net"
license=('GPL')
depends=('pidgin')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "pidgin-hotkeys.patch")
sha512sums=('99897a47f91c5ceacabdec13859526f6af6270e171b94b49183ad5cc5118b5e3f5377d02ffd0bdbdbaafdd6f23f400deb604a8fe686cd29103187276f20aca86'
            'db7fa4d478ab0f2c84ac061b8c4a5bcbd6047e83e9cf0b76c79153df3aaa32d567571ebf3fe7b5b757aacd6098bcba36e2846a3480d15069881f7f96f96aafcf')

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
