# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=eovpn
pkgver='1.30'
pkgrel=1
pkgdesc='Application to connect, manage and update OpenVPN configurations'
arch=('x86_64')
url='https://github.com/jkotra/eOVPN'
license=('GPL3')
depends=('gtk4' 'python' 'networkmanager' 'libsecret' 'libnotify' 'networkmanager-openvpn' 'python-gobject')
optdepends=('openvpn3')
makedepends=('gobject-introspection' 'meson' 'openvpn3' 'python-cffi')
source=("https://github.com/jkotra/eOVPN/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b59bafe7698616fdd7d95b1be600230bc486c376475933c938b4125af658564d')

build() {
  arch-meson eOVPN-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
