# Maintainer: SanskritFritz (gmail)
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Ionut Biru <ionut@archlinux.ro>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: g2g591 (AUR)

pkgname=pidgin-musictracker
pkgver=0.4.22
pkgrel=5
pkgdesc="A plugin for Pidgin which displays the music track currently playing."
url='http://code.google.com/p/pidgin-musictracker'
license=('GPL2')
depends=('pidgin' 'gtk2' 'dbus-glib')
makedepends=('xmms2')
arch=('i686' 'x86_64')
source=("http://pidgin-musictracker.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2")
options=('!libtool')
md5sums=('8d7225c705484db86b864cab5a536423')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS -Wno-deprecated-declarations"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

