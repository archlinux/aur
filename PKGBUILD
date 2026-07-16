pkgname=networkmanager-airvpn
pkgver=0.2.1
pkgrel=1
pkgdesc="NetworkManager VPN plugin for AirVPN (OpenVPN, with GNOME editor)"
arch=('x86_64')
url="https://github.com/LiteApplication/networkmanager-airvpn"
license=('GPL-2.0-or-later')
depends=(
  'networkmanager'
  'openvpn'
  'curl'
  'glib2'
  'gtk3'
  'gtk4'
  'libnma'
  'libnma-gtk4'
  'libsecret'
  'json-glib'
)
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('12f6ee5ae655a173ca194a057b8f0e1c9b72165cf8a0caba1e143c98bb2139f3')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
