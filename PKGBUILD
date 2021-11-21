# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=eovpn
pkgver=1.13
pkgrel=1
pkgdesc='Application to connect, manage and update OpenVPN configurations'
arch=('x86_64')
url='https://github.com/jkotra/eOVPN'
license=('GPL3')
depends=('gtk4' 'networkmanager' 'libsecret' 'networkmanager-openvpn' 'python-gobject')
makedepends=('gobject-introspection' 'meson')
source=("https://github.com/jkotra/eOVPN/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('478709ad0cc3deeb9bf35a2cf81ef100f50c09e7497aaa24ae054009f6402bd8')

build() {
  arch-meson eOVPN-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

