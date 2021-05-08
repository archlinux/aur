# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=eovpn
pkgver=0.27
pkgrel=1
pkgdesc='Application to connect, manage and update OpenVPN configurations'
arch=('x86_64')
url='https://github.com/jkotra/eOVPN'
license=('GPL3')
depends=('gtk3' 'networkmanager-openvpn' 'python-gobject' 'python-psutil' 'python-requests')
makedepends=('gobject-introspection' 'meson')
source=("https://github.com/jkotra/eOVPN/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8059fecebe4bc902433da59fe477f40465c86e24ace0872447e9e95a72a8459a')

build() {
  arch-meson eOVPN-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
