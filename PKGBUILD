# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=eovpn
pkgver='1.26'
pkgrel=1
pkgdesc='Application to connect, manage and update OpenVPN configurations'
arch=('x86_64')
url='https://github.com/jkotra/eOVPN'
license=('GPL3')
depends=('gtk4' 'python' 'networkmanager' 'libsecret' 'networkmanager-openvpn' 'python-gobject')
optdepends=('openvpn3')
makedepends=('gobject-introspection' 'meson' 'openvpn3')
source=("https://github.com/jkotra/eOVPN/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7669af9aa673aaeb95a6896d8b016051d8a78fb0e7e3184956448611c181771f')

build() {
  arch-meson eOVPN-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

