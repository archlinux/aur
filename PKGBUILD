# Maintainer: PrincParshia <princparshia@gmail.com>

pkgname=xdg-desktop-portal-adw
pkgver=1.0.1
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal using Libadwaita"
arch=(x86_64)
url="https://github.com/PrincParshia/xdg-desktop-portal-adw"
license=('LGPL')
depends=('cairo' 'dconf' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-desktop-4' 'graphene' 'gtk4' 'libadwaita' 'libx11' 'nautilus' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk')
makedepends=('git' 'meson' 'glib2-devel')
conflicts=('xdg-desktop-portal-gnome')
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd "$srcdir/xdg-desktop-portal-adw"
	meson setup build --prefix=/usr
	meson compile -C build
}

package() {
	cd "$srcdir/xdg-desktop-portal-adw"
	meson install -C build
}
