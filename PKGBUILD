
# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=plank-reloaded
pkgver=0.11.154
pkgrel=1
pkgdesc='Fork of the original Plank project, providing a simple dock for X11 desktop environments'
arch=('x86_64')
url='https://github.com/zquestz/plank-reloaded'
license=('GPL-3.0-or-later')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-menus'
         'gtk3' 'libgee' 'libwnck3' 'libx11' 'libxfixes' 'libxi' 'pango'
         'libdbusmenu-gtk3' 'libdbusmenu-glib')
makedepends=('gnome-common' 'git' 'intltool' 'vala' 'meson' 'ninja')
provides=('plank')
conflicts=('plank')
source=("https://github.com/zquestz/plank-reloaded/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9a8bf2745e45dff5b53850a2f29e6c1bf3b3eef0bf52f4ed962b315674a2da94')

build() {
  cd plank-reloaded-${pkgver}
  meson setup --prefix=/usr -D enable-apport=false -D production-release=true build
  meson compile -C build
}

package() {
  cd plank-reloaded-${pkgver}
  meson install --destdir="${pkgdir}" -C build
}

# vim: ts=2 sw=2 et:
