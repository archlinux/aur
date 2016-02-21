# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=lxlauncher-gtk3
_pkgname=lxlauncher
pkgver=0.2.5
pkgrel=1
pkgdesc='Open source clone of the Asus launcher for EeePC (GTK+ 3 version)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('gtk3' 'startup-notification' 'lxmenu-data' 'menu-cache')
makedepends=('intltool')
conflicts=($_pkgname)
backup=('etc/xdg/lxlauncher/gtkrc' 'etc/xdg/lxlauncher/settings.conf')
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz)
md5sums=('94a7a36af92f8409365b6a25b6904eeb')

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr --enable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
