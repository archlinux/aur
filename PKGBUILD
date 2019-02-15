# Based on the files created for Arch Linux by:
# American_Jesus <american.jesus.pt AT gmail DOT com>
# Gregory Petrosyan <gregory.mkv at gmail.com>

pkgname=connman-gtk
pkgver=1.1.1
pkgrel=2
pkgdesc="Tray menu and GUI for ConnMan"
arch=('x86_64')
url="https://github.com/jgke/connman-gtk"
license=('GPL2')
depends=('glib2' 'gtk3')
makedepends=('intltool' 'git' 'meson' 'openconnect')
optdepends=('openconnect: Easier authentication to AnyConnect VPNs')
_commit=b72c6ab3bb19c07325c8e659902b046daa23c506
source=("git+https://github.com/jgke/connman-gtk.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  mkdir build
  meson --prefix /usr --buildtype=plain -Duse_openconnect=dynamic "${srcdir}/${pkgname}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
