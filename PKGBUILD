# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=eovpn
pkgver=1.14
pkgrel=1
pkgdesc='Application to connect, manage and update OpenVPN configurations'
arch=('x86_64')
url='https://github.com/jkotra/eOVPN'
license=('GPL3')
depends=('gtk4' 'networkmanager' 'libsecret' 'networkmanager-openvpn' 'python-gobject')
makedepends=('gobject-introspection' 'meson')
source=("https://github.com/jkotra/eOVPN/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4e0c48cb90058bc3c02aaaf8f96a075b643359397f1bc437514935ad14158da5')

build() {
  arch-meson eOVPN-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

