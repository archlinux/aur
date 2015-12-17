# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm2
_realname=icewm
pkgver=1.3.12
pkgrel=1
pkgdesc="A window manager designed for speed, usability and consitency (enhanced)"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/icewm"
license=('LGPL')
provides=($_realname)
conflicts=($_realname)
replaces=($_realname)
depends=('libxrandr' 'libxinerama' 'libxft' 'libsm' 'gdk-pixbuf2' 'libsndfile')
makedepends=('xorg-mkfontdir' 'linuxdoc-tools')
source=("https://github.com/bbidulock/$_realname/releases/download/$pkgver/$_realname-$pkgver.tar.bz2")
md5sums=('3e3b8904d53998c0f46414722d86457c')

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
