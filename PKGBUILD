# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=gnome-remote-desktop
pkgver=0.1.4
pkgrel=1
pkgdesc='Remote desktop daemon for GNOME using pipewire'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
license=('GPL2')
depends=('libvncserver' 'dconf' 'pipewire')
makedepends=('git' 'meson')
provides=("$pkgname")
conflicts=("$pkgname")
source=(https://gitlab.gnome.org/jadahl/gnome-remote-desktop/uploads/8d66149c2dfd665aae283f4fd809dc6f/gnome-remote-desktop-0.1.4.tar.xz)
sha512sums=('9e7aee563d2b734a8507fcfd27ed467286b613f98caa5b5a262759d0e3e4d2c3d1b3e6028eb9f8dc11d02aa68d0bc9e20d7db3e0a4f24e53e4da7fe519816529')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
