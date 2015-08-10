# Author: Tobias Quinn <tobias@tobiasquinn.com>
# Maintainer: Tobias Quinn <tobias@tobiasquinn.com>
pkgname=gnome-shell-mousewheel-zoom
pkgver=0.8.0
pkgrel=1
pkgdesc="Enable mousewheel zoom using left-alt key using gnome-shell"
arch=('i686' 'x86_64')
url="https://github.com/tobiasquinn/gnome-shell-mousewheel-zoom"
license=('GPL3')
depends=('gnome-shell')
makedepends=('vala')
conflicts=('gnome-shell-mousewheel-zoom-git')
provides=('gnome-shell-mousewheel-zoom')
install=gnome-shell-mousewheel-zoom.install
source=("gnome-shell-mousewheel-zoom_$pkgver.tar.gz::https://github.com/tobiasquinn/gnome-shell-mousewheel-zoom/tarball/upstream/$pkgver")
md5sums=('6fd73ac036c8e6d2a499d28df52fdcb5')
_sourcename=('tobiasquinn-gnome-shell-mousewheel-zoom-16d8078')
build() {
  cd "$srcdir/${_sourcename}"

  make &> /dev/null
}

package() {
  install -D -m755 ${srcdir}/${_sourcename}/mousewheelzoom "${pkgdir}/usr/bin/mousewheelzoom" || return 1
  install -D -m644 ${srcdir}/${_sourcename}/mousewheelzoom.desktop "${pkgdir}/etc/xdg/autostart/mousewheelzoom.desktop" || return 1
  install -D -m644 ${srcdir}/${_sourcename}/com.tobiasquinn.mousewheelzoom.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/com.tobiasquinn.mousewheelzoom.gschema.xml" || return 1
}

# vim:set ts=2 sw=2 et:
