# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=lxappearance-obconf-gtk3
_pkgname=lxappearance-obconf
pkgver=0.2.2
pkgrel=1
pkgdesc='Plugin for LXAppearance to configure Openbox (GTK+ 3 version)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('lxappearance-gtk3' 'openbox' 'libsm')
makedepends=('intltool')
conflicts=($_pkgname)
provides=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz)
md5sums=('d958ac5514ba1707429ff6794ab59abf')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-static --enable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
