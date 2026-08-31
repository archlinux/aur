pkgname=networkmanager-airvpn
pkgver=0.2.2
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
sha256sums=('50ab0d4187f98ede7f584af2ea8f818fa98751e386a4b4567677214e3a935fe1')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
