# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=mudmagic
pkgver=1.9
pkgrel=4
pkgdesc="A GTK2 mud client with automapper"
arch=('x86_64')
url="http://www.mudmagic.com/mud-client/"
license=('GPL')
depends=('libglade>=2' 'libmxp' 'pcre' 'sqlite3')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://downloads.sourceforge.net/kyndig/$pkgname-$pkgver.tar.gz)
sha256sums=('bfb40914c88ce024c9e641890bdb83c60965303f4b8098d9986026014392f94a')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --disable-static --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install
}
