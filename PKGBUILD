# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=eovpn
pkgver=1.22
pkgrel=1
pkgdesc='Application to connect, manage and update OpenVPN configurations'
arch=('x86_64')
url='https://github.com/jkotra/eOVPN'
license=('GPL3')
depends=('gtk4' 'networkmanager' 'libsecret' 'networkmanager-openvpn' 'python-gobject')
optdepends=('openvpn3')
makedepends=('gobject-introspection' 'meson')
source=("https://github.com/jkotra/eOVPN/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0c72a7ce6aa2e30cacb7c1ec331b2a58445ccb2dae86b3b644352956367c11f5')

build() {
  meson eOVPN-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

