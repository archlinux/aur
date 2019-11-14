# Based on the files created for Arch Linux by:
# American_Jesus <american.jesus.pt AT gmail DOT com>
# Gregory Petrosyan <gregory.mkv at gmail.com>

pkgname=connman-gtk-nobluetooth
pkgver=1.1.1
pkgrel=2
pkgdesc="Tray menu and GUI for ConnMan, with Bluetooth patched out."
arch=('x86_64')
url="https://github.com/jgke/connman-gtk-nobluetooth"
license=('GPL2')
depends=('glib2' 'gtk3')
makedepends=('intltool' 'git' 'meson' 'openconnect')
optdepends=('openconnect: Easier authentication to AnyConnect VPNs')
conflicts=('connman-gtk')
_commit=aad93f7089b50c92d6b200de91106229a27fdfc7
source=("git+https://github.com/ajmar/connman-gtk-nobluetooth.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  mkdir build
  meson --prefix /usr --buildtype=plain -Duse_openconnect=dynamic "${srcdir}/${pkgname}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

