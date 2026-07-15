pkgname=networkmanager-airvpn
pkgver=0.1.0
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
sha256sums=('8f0c6b5dc0811e1248be40fec34d0b530582cbd2d00cd801e378764ccd34086c')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
