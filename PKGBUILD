# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=eovpn
pkgver=1.19
pkgrel=1
pkgdesc='Application to connect, manage and update OpenVPN configurations'
arch=('x86_64')
url='https://github.com/jkotra/eOVPN'
license=('GPL3')
depends=('gtk4' 'networkmanager' 'libsecret' 'networkmanager-openvpn' 'python-gobject')
optdepends=('openvpn3')
makedepends=('gobject-introspection' 'meson')
source=("https://github.com/jkotra/eOVPN/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('848a09d7265625aee3835fa04d608ddebc912308fcd682d74b4384ca10450e28')

build() {
  meson eOVPN-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

