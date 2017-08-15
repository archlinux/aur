# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm2
_realname=icewm
pkgver=1.4.2
pkgrel=5
pkgdesc="A window manager designed for speed, usability and consitency (enhanced)"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/icewm"
license=('LGPL')
provides=($_realname)
conflicts=($_realname)
replaces=($_realname)
depends=('libxrandr' 'libxinerama' 'libxft' 'libsm' 'gdk-pixbuf2' 'libsndfile')
makedepends=('xorg-mkfontdir' 'linuxdoc-tools')
optdepends=('icewm-extra-themes: extra themes')
source=("https://github.com/bbidulock/$_realname/releases/download/$pkgver/$_realname-$pkgver.tar.bz2")
md5sums=('3e7c3a95e7f8518346267f48a11966cd')

build() {
  cd $_realname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-shaped-decorations --enable-gradients \
    --enable-guievents --with-icesound=ALSA,OSS \
    --disable-menus-gnome2
  make V=0
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
