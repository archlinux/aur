# Maintainer: LunarEclipse <luna@lunareclipse.zone>

pkgname=xdg-native-messaging-proxy
pkgver=0.1.0
pkgrel=1
pkgdesc='Allow sandboxed applications to find and use native messaging hosts outside of the sandbox via dbus.'
arch=('x86_64' 'i686')
url='https://github.com/flatpak/xdg-native-messaging-proxy'
license=('LGPL-2.0-or-later')
options=()
depends=('dbus' 'gcc-libs' 'glibc' 'glib2' 'json-glib' 'libdex')
optdepends=()
makedepends=('meson' 'glib2-devel')
provides=()
conflicts=()
source=("$pkgname-$pkgver"::"https://github.com/flatpak/xdg-native-messaging-proxy/releases/download/$pkgver/xdg-native-messaging-proxy-$pkgver.tar.xz")
noextract=()
sha256sums=('4167e9408b0b07971e4f6948602cf464e002b2694bb2447e6c06725c273d93cb')

build() {
  arch-meson "$srcdir/$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

